#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

use crate::rule_api::*;
use flutter_rust_bridge::*;

// Section: imports

// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_test_log_1(port_: i64, log: *mut wire_uint_8_list) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
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

#[no_mangle]
pub extern "C" fn wire_is_legal_move(
    port_: i64,
    src_row: u8,
    src_col: u8,
    dst_row: u8,
    dst_col: u8,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
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

#[no_mangle]
pub extern "C" fn wire_get_orig_board(port_: i64) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
        WrapInfo {
            debug_name: "get_orig_board",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Ok(get_orig_board()),
    )
}

#[no_mangle]
pub extern "C" fn wire_update_board_data(port_: i64, row: u8, col: u8, piece_index: u8) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
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

#[no_mangle]
pub extern "C" fn wire_update_player_data(port_: i64, player: *mut wire_uint_8_list) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap(
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

// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: wrapper structs

// Section: static checks

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        if self.is_null() {
            None
        } else {
            Some(self.wire2api())
        }
    }
}

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}

impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

// Section: impl IntoDart

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturnStruct(val: support::WireSyncReturnStruct) {
    unsafe {
        let _ = support::vec_from_leak_ptr(val.ptr, val.len);
    }
}
