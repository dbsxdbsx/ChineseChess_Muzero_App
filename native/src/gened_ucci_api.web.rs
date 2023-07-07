use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_subscribe_ucci_engine(port_: MessagePort, player: i32, engine_path: String) {
    wire_subscribe_ucci_engine_impl(port_, player, engine_path)
}

#[wasm_bindgen]
pub fn wire_write_to_process(
    port_: MessagePort,
    command: String,
    msec: u32,
    player: i32,
    check_str_option: Option<String>,
) {
    wire_write_to_process_impl(port_, command, msec, player, check_str_option)
}

#[wasm_bindgen]
pub fn wire_is_process_loaded(port_: MessagePort, msec: u32, player: i32) {
    wire_is_process_loaded_impl(port_, msec, player)
}

#[wasm_bindgen]
pub fn wire_is_process_unloaded(port_: MessagePort, msec: u32, player: i32) {
    wire_is_process_unloaded_impl(port_, msec, player)
}

#[wasm_bindgen]
pub fn wire_get_engine_name(port_: MessagePort, player: i32) {
    wire_get_engine_name_impl(port_, player)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<Option<String>> for Option<String> {
    fn wire2api(self) -> Option<String> {
        self.map(Wire2Api::wire2api)
    }
}

// Section: impl Wire2Api for JsValue

impl Wire2Api<Option<String>> for JsValue {
    fn wire2api(self) -> Option<String> {
        (!self.is_undefined() && !self.is_null()).then(|| self.wire2api())
    }
}
impl Wire2Api<u32> for JsValue {
    fn wire2api(self) -> u32 {
        self.unchecked_into_f64() as _
    }
}
