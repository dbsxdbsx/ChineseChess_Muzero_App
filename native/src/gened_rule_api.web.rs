use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_test_log_1(port_: MessagePort, log: String) {
    wire_test_log_1_impl(port_, log)
}

#[wasm_bindgen]
pub fn wire_test_print_1(port_: MessagePort, log: String) {
    wire_test_print_1_impl(port_, log)
}

#[wasm_bindgen]
pub fn wire_is_legal_move(port_: MessagePort, src_row: u8, src_col: u8, dst_row: u8, dst_col: u8) {
    wire_is_legal_move_impl(port_, src_row, src_col, dst_row, dst_col)
}

#[wasm_bindgen]
pub fn wire_get_orig_board(port_: MessagePort) {
    wire_get_orig_board_impl(port_)
}

#[wasm_bindgen]
pub fn wire_update_board_data(port_: MessagePort, row: u8, col: u8, piece_index: u8) {
    wire_update_board_data_impl(port_, row, col, piece_index)
}

#[wasm_bindgen]
pub fn wire_update_player_data(port_: MessagePort, player: String) {
    wire_update_player_data_impl(port_, player)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

// Section: impl Wire2Api for JsValue
