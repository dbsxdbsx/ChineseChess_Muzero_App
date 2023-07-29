#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.79.0.

use crate::ucci_api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::rust2dart::IntoIntoDart;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

use crate::bridge_generated_shares;
use crate::bridge_generated_shares::*;
use crate::chess::Player;

// Section: wire functions

fn wire_subscribe_ucci_engine_impl(
    port_: MessagePort,
    player: impl Wire2Api<Player> + UnwindSafe,
    engine_path: impl bridge_generated_shares::Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, ()>(
        WrapInfo {
            debug_name: "subscribe_ucci_engine",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || {
            let api_player = player.wire2api();
            let api_engine_path = engine_path.wire2api();
            move |task_callback| {
                subscribe_ucci_engine(
                    api_player,
                    api_engine_path,
                    task_callback.stream_sink::<_, String>(),
                )
            }
        },
    )
}
fn wire_write_to_process_impl(
    port_: MessagePort,
    command: impl bridge_generated_shares::Wire2Api<String> + UnwindSafe,
    msec: impl Wire2Api<u32> + UnwindSafe,
    player: impl Wire2Api<Player> + UnwindSafe,
    check_str_option: impl bridge_generated_shares::Wire2Api<Option<String>> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, bool>(
        WrapInfo {
            debug_name: "write_to_process",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_command = command.wire2api();
            let api_msec = msec.wire2api();
            let api_player = player.wire2api();
            let api_check_str_option = check_str_option.wire2api();
            move |task_callback| {
                Ok(write_to_process(
                    api_command,
                    api_msec,
                    api_player,
                    api_check_str_option,
                ))
            }
        },
    )
}
fn wire_is_process_loaded_impl(
    port_: MessagePort,
    msec: impl Wire2Api<u32> + UnwindSafe,
    player: impl Wire2Api<Player> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, bool>(
        WrapInfo {
            debug_name: "is_process_loaded",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_msec = msec.wire2api();
            let api_player = player.wire2api();
            move |task_callback| Ok(is_process_loaded(api_msec, api_player))
        },
    )
}
fn wire_is_process_unloaded_impl(
    port_: MessagePort,
    msec: impl Wire2Api<u32> + UnwindSafe,
    player: impl Wire2Api<Player> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, bool>(
        WrapInfo {
            debug_name: "is_process_unloaded",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_msec = msec.wire2api();
            let api_player = player.wire2api();
            move |task_callback| Ok(is_process_unloaded(api_msec, api_player))
        },
    )
}
fn wire_get_engine_name_impl(port_: MessagePort, player: impl Wire2Api<Player> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, String>(
        WrapInfo {
            debug_name: "get_engine_name",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_player = player.wire2api();
            move |task_callback| Ok(get_engine_name(api_player))
        },
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<Player> for i32 {
    fn wire2api(self) -> Player {
        match self {
            0 => Player::Red,
            1 => Player::Black,
            2 => Player::Unknown,
            _ => unreachable!("Invalid variant for Player: {}", self),
        }
    }
}
impl Wire2Api<u32> for u32 {
    fn wire2api(self) -> u32 {
        self
    }
}
// Section: impl IntoDart

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "gened_ucci_api.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;

#[cfg(not(target_family = "wasm"))]
#[path = "gened_ucci_api.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
