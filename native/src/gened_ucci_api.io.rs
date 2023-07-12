use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_subscribe_ucci_engine(
    port_: i64,
    player: i32,
    engine_path: *mut wire_uint_8_list,
) {
    wire_subscribe_ucci_engine_impl(port_, player, engine_path)
}

#[no_mangle]
pub extern "C" fn wire_write_to_process(
    port_: i64,
    command: *mut wire_uint_8_list,
    msec: u32,
    player: i32,
    check_str_option: *mut wire_uint_8_list,
) {
    wire_write_to_process_impl(port_, command, msec, player, check_str_option)
}

#[no_mangle]
pub extern "C" fn wire_is_process_loaded(port_: i64, msec: u32, player: i32) {
    wire_is_process_loaded_impl(port_, msec, player)
}

#[no_mangle]
pub extern "C" fn wire_is_process_unloaded(port_: i64, msec: u32, player: i32) {
    wire_is_process_unloaded_impl(port_, msec, player)
}

#[no_mangle]
pub extern "C" fn wire_get_engine_name(port_: i64, player: i32) {
    wire_get_engine_name_impl(port_, player)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

// Section: wire structs

// Section: impl NewWithNullPtr

// Section: sync execution mode utility
