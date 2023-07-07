use flutter_rust_bridge::StreamSink;
use once_cell::sync::Lazy;
use parking_lot::Mutex;
use std::sync::Arc;

use crate::chess::Player;

pub static RED_LISTENER: Lazy<Arc<Mutex<Option<StreamSink<String>>>>> = Lazy::new(Default::default);
pub static BLACK_LISTENER: Lazy<Arc<Mutex<Option<StreamSink<String>>>>> =
    Lazy::new(Default::default);
//
pub static COMMAND: Lazy<Arc<Mutex<String>>> = Lazy::new(Default::default);
pub static FEEDBACK: Lazy<Arc<Mutex<String>>> = Lazy::new(Default::default);
//
pub static RED_FLAG: Lazy<Arc<Mutex<bool>>> = Lazy::new(Default::default);
pub static BLACK_FLAG: Lazy<Arc<Mutex<bool>>> = Lazy::new(Default::default);
//
pub static RED_PROCESS_LOADED: Lazy<Arc<Mutex<bool>>> = Lazy::new(Default::default);
pub static BLACK_PROCESS_LOADED: Lazy<Arc<Mutex<bool>>> = Lazy::new(Default::default);
//
pub static RED_ENGINE_NAME: Lazy<Arc<Mutex<String>>> = Lazy::new(Default::default);
pub static BLACK_ENGINE_NAME: Lazy<Arc<Mutex<String>>> = Lazy::new(Default::default);
pub static RED_ENGINE_PATH: Lazy<Arc<Mutex<String>>> = Lazy::new(Default::default);
pub static BLACK_ENGINE_PATH: Lazy<Arc<Mutex<String>>> = Lazy::new(Default::default);

// pub fn get_listener(player: Player) -> MutexGuard<Option<StreamSink<String>>> {
pub fn get_cloned_listener(player: Player) -> Option<StreamSink<String>> {
    match player {
        Player::Red => (*RED_LISTENER.lock()).clone(),
        Player::Black => (*BLACK_LISTENER.lock()).clone(),
        Player::Unknown => panic!(),
    }
}

pub fn set_listener(player: Player, listener: StreamSink<String>) {
    match player {
        Player::Red => (*RED_LISTENER.lock()) = Some(listener),
        Player::Black => (*BLACK_LISTENER.lock()) = Some(listener),
        Player::Unknown => panic!(),
    }
}

pub fn set_engine_name(player: Player, name: &str) {
    match player {
        Player::Red => *RED_ENGINE_NAME.lock() = name.to_owned(),
        Player::Black => *BLACK_ENGINE_NAME.lock() = name.to_owned(),
        Player::Unknown => panic!(),
    }
}

pub fn set_process_loaded(player: Player, is_loaded: bool) {
    match player {
        Player::Red => *RED_PROCESS_LOADED.lock() = is_loaded,
        Player::Black => *BLACK_PROCESS_LOADED.lock() = is_loaded,
        Player::Unknown => panic!(),
    }
}

pub fn get_engine_path(player: Player) -> String {
    match player {
        Player::Red => (*RED_ENGINE_PATH.lock()).clone(),
        Player::Black => (*BLACK_ENGINE_PATH.lock()).clone(),
        Player::Unknown => panic!(),
    }
}

pub fn set_engine_path(player: Player, engine_path: String) {
    match player {
        Player::Red => *RED_ENGINE_PATH.lock() = engine_path,
        Player::Black => *BLACK_ENGINE_PATH.lock() = engine_path,
        Player::Unknown => panic!(),
    }
}

pub fn get_flag_lock(player: Player) -> bool {
    match player {
        Player::Red => *RED_FLAG.lock(),
        Player::Black => *BLACK_FLAG.lock(),
        Player::Unknown => panic!(),
    }
}

pub fn set_flag_lock(player: Player, is_lock: bool) {
    match player {
        Player::Red => (*RED_FLAG.lock()) = is_lock,
        Player::Black => (*BLACK_FLAG.lock()) = is_lock,
        Player::Unknown => panic!(),
    }
}
