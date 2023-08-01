// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.79.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'gened_ucci_api.dart';
export 'gened_ucci_api.dart';
import 'bridge_generated_shares.web.dart';

class UcciApiPlatform extends FlutterRustBridgeBase<UcciApiWire>
    with FlutterRustBridgeSetupMixin {
  final BridgeGeneratedSharesPlatform _sharedPlatform;
  UcciApiPlatform(FutureOr<WasmModule> dylib)
      : _sharedPlatform = BridgeGeneratedSharesPlatform(dylib),
        super(UcciApiWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

  @protected
  String? api2wire_opt_String(String? raw) {
    return raw == null ? null : _sharedPlatform.api2wire_String(raw);
  }

// Section: finalizer
}

// Section: WASM wire module

@JS('wasm_bindgen')
external UcciApiWasmModule get wasmModule;

@JS()
@anonymous
class UcciApiWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external UcciApiWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* void */ wire_subscribe_ucci_engine(
      NativePortType port_, int player, String engine_path);

  external dynamic /* void */ wire_write_to_process(NativePortType port_,
      String command, int msec, int player, String? check_str_option);

  external dynamic /* void */ wire_is_process_loaded(
      NativePortType port_, int msec, int player);

  external dynamic /* void */ wire_is_process_unloaded(
      NativePortType port_, int msec, int player);

  external dynamic /* void */ wire_get_engine_name(
      NativePortType port_, int player);
}

// Section: WASM wire connector

class UcciApiWire extends FlutterRustBridgeWasmWireBase<UcciApiWasmModule> {
  UcciApiWire(FutureOr<WasmModule> module)
      : super(WasmModule.cast<UcciApiWasmModule>(module));

  void wire_subscribe_ucci_engine(
          NativePortType port_, int player, String engine_path) =>
      wasmModule.wire_subscribe_ucci_engine(port_, player, engine_path);

  void wire_write_to_process(NativePortType port_, String command, int msec,
          int player, String? check_str_option) =>
      wasmModule.wire_write_to_process(
          port_, command, msec, player, check_str_option);

  void wire_is_process_loaded(NativePortType port_, int msec, int player) =>
      wasmModule.wire_is_process_loaded(port_, msec, player);

  void wire_is_process_unloaded(NativePortType port_, int msec, int player) =>
      wasmModule.wire_is_process_unloaded(port_, msec, player);

  void wire_get_engine_name(NativePortType port_, int player) =>
      wasmModule.wire_get_engine_name(port_, player);
}