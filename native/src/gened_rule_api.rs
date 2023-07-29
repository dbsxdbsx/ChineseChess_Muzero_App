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

use crate::rule_api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::rust2dart::IntoIntoDart;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

use crate::bridge_generated_shares;
use crate::bridge_generated_shares::*;

// Section: wire functions

fn wire_test_log_1_impl(
    port_: MessagePort,
    log: impl bridge_generated_shares::Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, ()>(
        WrapInfo {
            debug_name: "test_log_1",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_log = log.wire2api();
            move |task_callback| Ok(test_log_1(api_log))
        },
    )
}
fn wire_test_print_1_impl(
    port_: MessagePort,
    log: impl bridge_generated_shares::Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, ()>(
        WrapInfo {
            debug_name: "test_print_1",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_log = log.wire2api();
            move |task_callback| Ok(test_print_1(api_log))
        },
    )
}
fn wire_is_legal_move_impl(
    port_: MessagePort,
    src_row: impl bridge_generated_shares::Wire2Api<u8> + UnwindSafe,
    src_col: impl bridge_generated_shares::Wire2Api<u8> + UnwindSafe,
    dst_row: impl bridge_generated_shares::Wire2Api<u8> + UnwindSafe,
    dst_col: impl bridge_generated_shares::Wire2Api<u8> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, bool>(
        WrapInfo {
            debug_name: "is_legal_move",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_src_row = src_row.wire2api();
            let api_src_col = src_col.wire2api();
            let api_dst_row = dst_row.wire2api();
            let api_dst_col = dst_col.wire2api();
            move |task_callback| {
                Ok(is_legal_move(
                    api_src_row,
                    api_src_col,
                    api_dst_row,
                    api_dst_col,
                ))
            }
        },
    )
}
fn wire_get_orig_board_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, [u8; 256]>(
        WrapInfo {
            debug_name: "get_orig_board",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(get_orig_board()),
    )
}
fn wire_update_board_data_impl(
    port_: MessagePort,
    row: impl bridge_generated_shares::Wire2Api<u8> + UnwindSafe,
    col: impl bridge_generated_shares::Wire2Api<u8> + UnwindSafe,
    piece_index: impl bridge_generated_shares::Wire2Api<u8> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, ()>(
        WrapInfo {
            debug_name: "update_board_data",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_row = row.wire2api();
            let api_col = col.wire2api();
            let api_piece_index = piece_index.wire2api();
            move |task_callback| Ok(update_board_data(api_row, api_col, api_piece_index))
        },
    )
}
fn wire_update_player_data_impl(
    port_: MessagePort,
    player: impl bridge_generated_shares::Wire2Api<String> + UnwindSafe,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, ()>(
        WrapInfo {
            debug_name: "update_player_data",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_player = player.wire2api();
            move |task_callback| Ok(update_player_data(api_player))
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
// Section: impl IntoDart

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "gened_rule_api.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;

#[cfg(not(target_family = "wasm"))]
#[path = "gened_rule_api.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
