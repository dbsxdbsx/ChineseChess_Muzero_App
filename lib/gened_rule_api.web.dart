// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.75.3.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'gened_rule_api.dart';
export 'gened_rule_api.dart';
import 'bridge_generated_shares.web.dart';

class RuleApiPlatform extends FlutterRustBridgeBase<RuleApiWire>
    with FlutterRustBridgeSetupMixin {
  final BridgeGeneratedSharesPlatform _sharedPlatform;
  RuleApiPlatform(FutureOr<WasmModule> dylib)
      : _sharedPlatform = BridgeGeneratedSharesPlatform(dylib),
        super(RuleApiWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

// Section: finalizer
}

// Section: WASM wire module

@JS('wasm_bindgen')
external RuleApiWasmModule get wasmModule;

@JS()
@anonymous
class RuleApiWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external RuleApiWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* void */ wire_test_log_1(NativePortType port_, String log);

  external dynamic /* void */ wire_test_print_1(
      NativePortType port_, String log);

  external dynamic /* void */ wire_is_legal_move(
      NativePortType port_, int src_row, int src_col, int dst_row, int dst_col);

  external dynamic /* void */ wire_get_orig_board(NativePortType port_);

  external dynamic /* void */ wire_update_board_data(
      NativePortType port_, int row, int col, int piece_index);

  external dynamic /* void */ wire_update_player_data(
      NativePortType port_, String player);
}

// Section: WASM wire connector

class RuleApiWire extends FlutterRustBridgeWasmWireBase<RuleApiWasmModule> {
  RuleApiWire(FutureOr<WasmModule> module)
      : super(WasmModule.cast<RuleApiWasmModule>(module));

  void wire_test_log_1(NativePortType port_, String log) =>
      wasmModule.wire_test_log_1(port_, log);

  void wire_test_print_1(NativePortType port_, String log) =>
      wasmModule.wire_test_print_1(port_, log);

  void wire_is_legal_move(NativePortType port_, int src_row, int src_col,
          int dst_row, int dst_col) =>
      wasmModule.wire_is_legal_move(port_, src_row, src_col, dst_row, dst_col);

  void wire_get_orig_board(NativePortType port_) =>
      wasmModule.wire_get_orig_board(port_);

  void wire_update_board_data(
          NativePortType port_, int row, int col, int piece_index) =>
      wasmModule.wire_update_board_data(port_, row, col, piece_index);

  void wire_update_player_data(NativePortType port_, String player) =>
      wasmModule.wire_update_player_data(port_, player);
}
