use core::time;
use std::process::Stdio;
use std::thread;

use flutter_rust_bridge::StreamSink;

use futures_util::stream::StreamExt;
use log::{debug, error, info, warn};
use process_stream::{Process, ProcessExt};
use tokio::io::AsyncWriteExt;

use crate::chess::Player;
// use crate::chess::MySharedStruct;
use crate::ucci::{
    get_cloned_listener, get_engine_path, get_flag_lock, set_engine_name, set_engine_path,
    set_flag_lock, set_listener, set_process_loaded, BLACK_ENGINE_NAME, BLACK_PROCESS_LOADED,
    COMMAND, FEEDBACK, RED_ENGINE_NAME, RED_PROCESS_LOADED,
};

// refer:https://github.com/fzyzcjy/flutter_rust_bridge/issues/517
// refer:http://cjycode.com/flutter_rust_bridge/feature/stream.html
// refer:http://cjycode.com/flutter_rust_bridge/feature/async_rust.html
// #[tokio::main(flavor = "current_thread")]//别用这个，会阻塞reader_task输出的。
#[tokio::main]
pub async fn subscribe_ucci_engine(
    player: Player,
    engine_path: String,
    listener: StreamSink<String>,
) -> anyhow::Result<()> {
    set_listener(player, listener);
    warn!("已捕获监听程序");

    info!("将打开的引擎路径为：{engine_path}");
    let mut process = Process::new(&engine_path);
    process.stdin(Stdio::piped());
    warn!("已打开引擎进程");

    set_engine_path(player, engine_path);

    let (reader_task, _writer_task) = if let Some(cloned_listener) = get_cloned_listener(player) {
        let mut stream = process.spawn_and_stream().unwrap();
        // 用于接收消息的reader_task
        let reader_task = tokio::spawn(async move {
            loop {
                // debug!("reader线程：{:?}，玩家：{player:?}", thread::current().id());
                match stream.next().await {
                    Some(value) => {
                        if value.is_exit() {
                            debug!("引擎进程退出");
                            break;
                        }
                        let feedback_str = (*value).to_string();
                        // TODO: "utf-8"以外的编码如何处理
                        if feedback_str.contains("id name ") {
                            let string_vec = feedback_str
                                .split(' ')
                                .filter(|&s| !s.is_empty())
                                .map(|s| s.to_string())
                                .collect::<Vec<_>>();
                            set_engine_name(player, &string_vec[2]);
                        } else if feedback_str == "bye" {
                            set_engine_name(player, "");
                        }
                        info!("engine反馈： {}", feedback_str);
                        *FEEDBACK.lock() = feedback_str.clone();
                        cloned_listener.add(feedback_str);
                    }
                    // TODO：本意希望进程异常时触发，但好像不会触发
                    None => {
                        warn!("engine[异常]反馈：none");
                        return;
                    }
                }
                // thread::sleep(time::Duration::from_millis(200));
            }
        });
        warn!("已监听ucci进程输出");

        //用于向进程写入消息的writer_task
        let mut writer = process.take_stdin().unwrap();
        let writer_task = tokio::spawn(async move {
            loop {
                if get_flag_lock(player) {
                    // debug!("writer线程：{:?}，玩家：{player:?}", thread::current().id());
                    let cmd_str = (*COMMAND.lock()).clone();
                    let cmd_byte = cmd_str.as_bytes();
                    info!("执行命令：{cmd_str}");
                    if let Err(e) = writer.write(cmd_byte).await {
                        error!("写入命令{cmd_str}异常: {e}");
                        return;
                    }
                    set_flag_lock(player, false);
                }
            }
        });
        warn!("已监听ucci进程输入");

        (reader_task, writer_task)
    } else {
        set_process_loaded(player, false);
        error!("监听程序读取出错！");
        panic!("监听程序读取出错！");
    };

    set_process_loaded(player, true);
    info!("引擎启动");

    // 仅需等待read_task即可
    debug!(
        "引擎等待中,所属线程：{:?}，玩家：{player:?}",
        thread::current().id()
    );
    reader_task.await.expect("read异常退出");
    // writer_task.await.expect("write异常退出");

    set_process_loaded(player, false);
    info!(
        "引擎退出,所属线程：{:?}，玩家：{player:?}",
        thread::current().id()
    );

    Ok(())
}

pub fn write_to_process(
    command: String,
    msec: u32,
    player: Player,
    check_str_option: Option<String>,
) -> bool {
    if !command.is_empty() {
        *COMMAND.lock() = format!("{command}\r\n");
        set_flag_lock(player, true);

        // 反馈响应
        if let Some(check_str) = &check_str_option {
            let now = std::time::SystemTime::now();
            let sleep_msec = time::Duration::from_millis(200);
            while now.elapsed().unwrap().as_millis() < msec as u128 {
                if check_str == &(*FEEDBACK.lock()) {
                    // debug!("反馈检查{check_str}成功");
                    return true;
                }
                thread::sleep(sleep_msec);
                // return false;这里不能直接返回false，比如“ucciok”就是在好几个输出后才有的值
            }
            // debug!("反馈检查{check_str}失败");
            return false;
        } else {
            // debug!("无反馈检查，返回true");
            return true;
        }
    }
    true
}

//只要引擎启动了，即使没有ucciok也返回true
pub fn is_process_loaded(msec: u32, player: Player) -> bool {
    let now = std::time::SystemTime::now();
    let sleep_msec = time::Duration::from_millis(200);
    while now.elapsed().unwrap().as_millis() < msec as u128 {
        match player {
            Player::Red => {
                if *RED_PROCESS_LOADED.lock() {
                    return true;
                }
            }
            Player::Black => {
                if *BLACK_PROCESS_LOADED.lock() {
                    return true;
                }
            }
            Player::Unknown => panic!(),
        }

        thread::sleep(sleep_msec);
    }
    false
}

pub fn is_process_unloaded(msec: u32, player: Player) -> bool {
    let now = std::time::SystemTime::now();
    let sleep_msec = time::Duration::from_millis(100);
    while now.elapsed().unwrap().as_millis() < msec as u128 {
        match player {
            Player::Red => {
                if !(*RED_PROCESS_LOADED.lock()) {
                    return true;
                }
            }
            Player::Black => {
                if !(*BLACK_PROCESS_LOADED.lock()) {
                    return true;
                }
            }
            Player::Unknown => panic!(),
        }
        thread::sleep(sleep_msec);
    }
    false
}

pub fn get_engine_name(player: Player) -> String {
    #[cfg(windows)]
    let dilimiter = '\\';
    #[cfg(not(windows))]
    let dilimiter = '/';

    match player {
        Player::Red => {
            let engine_name = (*RED_ENGINE_NAME.lock()).clone();
            if engine_name.trim().is_empty() && *RED_PROCESS_LOADED.lock() {
                let engine_path = get_engine_path(player);
                debug!("引擎目录是：{engine_path}");
                let split_vec = engine_path
                    .split(dilimiter)
                    .filter(|&s| !s.is_empty())
                    .map(|s| s.to_string())
                    .collect::<Vec<_>>();
                let engine_file_name = split_vec.last().unwrap();
                let split_vec = engine_file_name
                    .split('.')
                    .filter(|&s| !s.is_empty())
                    .map(|s| s.to_string())
                    .collect::<Vec<_>>();
                split_vec[0].to_string()
            } else {
                engine_name
            }
        }
        Player::Black => {
            let engine_name = (*BLACK_ENGINE_NAME.lock()).clone();
            if engine_name.trim().is_empty() && *BLACK_PROCESS_LOADED.lock() {
                let engine_path = get_engine_path(player);
                debug!("引擎目录是：{engine_path}");
                let split_vec = engine_path
                    .split(dilimiter)
                    .filter(|&s| !s.is_empty())
                    .map(|s| s.to_string())
                    .collect::<Vec<_>>();
                let engine_file_name = split_vec.last().unwrap();
                let split_vec = engine_file_name
                    .split('.')
                    .filter(|&s| !s.is_empty())
                    .map(|s| s.to_string())
                    .collect::<Vec<_>>();
                split_vec[0].to_string()
            } else {
                engine_name
            }
        }
        Player::Unknown => panic!(),
    }
}

// TODO: error with customized struct?
// pub fn test_shared_method_with_custom_struct_in_ucci_api(s: MySharedStruct) -> String {
//     s.test_shared_method()
// }
