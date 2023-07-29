// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.79.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'gened_ucci_api.io.dart'
    if (dart.library.html) 'gened_ucci_api.web.dart';
import 'bridge_generated_shares.dart';
export 'bridge_generated_shares.dart';
import 'bridge_generated_shares.io.dart'
    if (dart.library.html) 'bridge_generated_shares.web.dart';

class UcciApiImpl implements UcciApi {
  final UcciApiPlatform _platform;
  final BridgeGeneratedSharesPlatform _sharedPlatform;
  final BridgeGeneratedSharesImpl _sharedImpl;

  factory UcciApiImpl(ExternalLibrary dylib) {
    final platform = UcciApiPlatform(dylib);
    final sharedPlatform = BridgeGeneratedSharesPlatform(dylib);
    final sharedImpl = BridgeGeneratedSharesImpl(dylib);
    return UcciApiImpl.raw(platform, sharedPlatform, sharedImpl);
  }

  UcciApiImpl.raw(this._platform, this._sharedPlatform, this._sharedImpl);

  /// Only valid on web/WASM platforms.
  factory UcciApiImpl.wasm(FutureOr<WasmModule> module) =>
      UcciApiImpl(module as ExternalLibrary);

  Stream<String> subscribeUcciEngine(
      {required Player player, required String enginePath, dynamic hint}) {
    var arg0 = api2wire_player(player);
    var arg1 = _sharedPlatform.api2wire_String(enginePath);
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_subscribe_ucci_engine(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kSubscribeUcciEngineConstMeta,
      argValues: [player, enginePath],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSubscribeUcciEngineConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "subscribe_ucci_engine",
        argNames: ["player", "enginePath"],
      );

  Future<bool> writeToProcess(
      {required String command,
      required int msec,
      required Player player,
      String? checkStrOption,
      dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(command);
    var arg1 = api2wire_u32(msec);
    var arg2 = api2wire_player(player);
    var arg3 = _platform.api2wire_opt_String(checkStrOption);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_write_to_process(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _sharedImpl.wire2api_bool,
      constMeta: kWriteToProcessConstMeta,
      argValues: [command, msec, player, checkStrOption],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kWriteToProcessConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "write_to_process",
        argNames: ["command", "msec", "player", "checkStrOption"],
      );

  Future<bool> isProcessLoaded(
      {required int msec, required Player player, dynamic hint}) {
    var arg0 = api2wire_u32(msec);
    var arg1 = api2wire_player(player);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_is_process_loaded(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_bool,
      constMeta: kIsProcessLoadedConstMeta,
      argValues: [msec, player],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kIsProcessLoadedConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "is_process_loaded",
        argNames: ["msec", "player"],
      );

  Future<bool> isProcessUnloaded(
      {required int msec, required Player player, dynamic hint}) {
    var arg0 = api2wire_u32(msec);
    var arg1 = api2wire_player(player);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_is_process_unloaded(port_, arg0, arg1),
      parseSuccessData: _sharedImpl.wire2api_bool,
      constMeta: kIsProcessUnloadedConstMeta,
      argValues: [msec, player],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kIsProcessUnloadedConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "is_process_unloaded",
        argNames: ["msec", "player"],
      );

  Future<String> getEngineName({required Player player, dynamic hint}) {
    var arg0 = api2wire_player(player);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_get_engine_name(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_String,
      constMeta: kGetEngineNameConstMeta,
      argValues: [player],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetEngineNameConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_engine_name",
        argNames: ["player"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api
}

// Section: api2wire

@protected
int api2wire_player(Player raw) {
  return api2wire_i32(raw.index);
}

@protected
int api2wire_u32(int raw) {
  return raw;
}
// Section: finalizer
