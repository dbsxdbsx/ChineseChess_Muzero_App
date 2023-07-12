use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_test_log_1(port_: i64, log: *mut wire_uint_8_list) {
    wire_test_log_1_impl(port_, log)
}

#[no_mangle]
pub extern "C" fn wire_test_print_1(port_: i64, log: *mut wire_uint_8_list) {
    wire_test_print_1_impl(port_, log)
}

#[no_mangle]
pub extern "C" fn wire_is_legal_move(
    port_: i64,
    src_row: u8,
    src_col: u8,
    dst_row: u8,
    dst_col: u8,
) {
    wire_is_legal_move_impl(port_, src_row, src_col, dst_row, dst_col)
}

#[no_mangle]
pub extern "C" fn wire_get_orig_board(port_: i64) {
    wire_get_orig_board_impl(port_)
}

#[no_mangle]
pub extern "C" fn wire_update_board_data(port_: i64, row: u8, col: u8, piece_index: u8) {
    wire_update_board_data_impl(port_, row, col, piece_index)
}

#[no_mangle]
pub extern "C" fn wire_update_player_data(port_: i64, player: *mut wire_uint_8_list) {
    wire_update_player_data_impl(port_, player)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

// Section: wire structs

// Section: impl NewWithNullPtr

// Section: sync execution mode utility
