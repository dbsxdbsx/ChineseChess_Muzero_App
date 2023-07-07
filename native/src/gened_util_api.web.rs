use super::*;
// Section: wire functions

#[wasm_bindgen]
pub fn wire_platform(port_: MessagePort) {
    wire_platform_impl(port_)
}

#[wasm_bindgen]
pub fn wire_rust_release_mode(port_: MessagePort) {
    wire_rust_release_mode_impl(port_)
}

#[wasm_bindgen]
pub fn wire_activate(port_: MessagePort) {
    wire_activate_impl(port_)
}

#[wasm_bindgen]
pub fn wire_to_string__method__Player(port_: MessagePort, that: i32) {
    wire_to_string__method__Player_impl(port_, that)
}

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

// Section: impl Wire2Api for JsValue
