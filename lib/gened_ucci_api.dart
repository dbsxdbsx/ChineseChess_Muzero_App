// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports

import 'dart:convert';
import 'dart:typed_data';

import 'dart:convert';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'dart:ffi' as ffi;

abstract class UcciApi {
  Stream<String> subscribeUcciEngine(
      {required Player player, required String enginePath, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSubscribeUcciEngineConstMeta;

  Future<bool> writeToProcess(
      {required String command,
      required int msec,
      required Player player,
      String? checkStrOption,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kWriteToProcessConstMeta;

  Future<bool> isProcessLoaded(
      {required int msec, required Player player, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kIsProcessLoadedConstMeta;

  Future<bool> isProcessUnloaded(
      {required int msec, required Player player, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kIsProcessUnloadedConstMeta;

  Future<String> getEngineName({required Player player, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetEngineNameConstMeta;
}

enum Player {
  Red,
  Black,
}

class UcciApiImpl extends FlutterRustBridgeBase<UcciApiWire>
    implements UcciApi {
  factory UcciApiImpl(ffi.DynamicLibrary dylib) =>
      UcciApiImpl.raw(UcciApiWire(dylib));

  UcciApiImpl.raw(UcciApiWire inner) : super(inner);

  Stream<String> subscribeUcciEngine(
          {required Player player, required String enginePath, dynamic hint}) =>
      executeStream(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_subscribe_ucci_engine(
            port_, _api2wire_player(player), _api2wire_String(enginePath)),
        parseSuccessData: _wire2api_String,
        constMeta: kSubscribeUcciEngineConstMeta,
        argValues: [player, enginePath],
        hint: hint,
      ));

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
          dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_write_to_process(
            port_,
            _api2wire_String(command),
            _api2wire_u32(msec),
            _api2wire_player(player),
            _api2wire_opt_String(checkStrOption)),
        parseSuccessData: _wire2api_bool,
        constMeta: kWriteToProcessConstMeta,
        argValues: [command, msec, player, checkStrOption],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kWriteToProcessConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "write_to_process",
        argNames: ["command", "msec", "player", "checkStrOption"],
      );

  Future<bool> isProcessLoaded(
          {required int msec, required Player player, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_is_process_loaded(
            port_, _api2wire_u32(msec), _api2wire_player(player)),
        parseSuccessData: _wire2api_bool,
        constMeta: kIsProcessLoadedConstMeta,
        argValues: [msec, player],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kIsProcessLoadedConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "is_process_loaded",
        argNames: ["msec", "player"],
      );

  Future<bool> isProcessUnloaded(
          {required int msec, required Player player, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) => inner.wire_is_process_unloaded(
            port_, _api2wire_u32(msec), _api2wire_player(player)),
        parseSuccessData: _wire2api_bool,
        constMeta: kIsProcessUnloadedConstMeta,
        argValues: [msec, player],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kIsProcessUnloadedConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "is_process_unloaded",
        argNames: ["msec", "player"],
      );

  Future<String> getEngineName({required Player player, dynamic hint}) =>
      executeNormal(FlutterRustBridgeTask(
        callFfi: (port_) =>
            inner.wire_get_engine_name(port_, _api2wire_player(player)),
        parseSuccessData: _wire2api_String,
        constMeta: kGetEngineNameConstMeta,
        argValues: [player],
        hint: hint,
      ));

  FlutterRustBridgeTaskConstMeta get kGetEngineNameConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_engine_name",
        argNames: ["player"],
      );

  // Section: api2wire
  ffi.Pointer<wire_uint_8_list> _api2wire_String(String raw) {
    return _api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  int _api2wire_i32(int raw) {
    return raw;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_opt_String(String? raw) {
    return raw == null ? ffi.nullptr : _api2wire_String(raw);
  }

  int _api2wire_player(Player raw) {
    return _api2wire_i32(raw.index);
  }

  int _api2wire_u32(int raw) {
    return raw;
  }

  int _api2wire_u8(int raw) {
    return raw;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_1(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  // Section: api_fill_to_wire

}

// Section: wire2api
String _wire2api_String(dynamic raw) {
  return raw as String;
}

bool _wire2api_bool(dynamic raw) {
  return raw as bool;
}

int _wire2api_u8(dynamic raw) {
  return raw as int;
}

Uint8List _wire2api_uint_8_list(dynamic raw) {
  return raw as Uint8List;
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class UcciApiWire implements FlutterRustBridgeWireBase {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  UcciApiWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  UcciApiWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void free_WireSyncReturnStruct(
    WireSyncReturnStruct val,
  ) {
    return _free_WireSyncReturnStruct(
      val,
    );
  }

  late final _free_WireSyncReturnStructPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturnStruct)>>(
          'free_WireSyncReturnStruct');
  late final _free_WireSyncReturnStruct = _free_WireSyncReturnStructPtr
      .asFunction<void Function(WireSyncReturnStruct)>();

  void wire_subscribe_ucci_engine(
    int port_,
    int player,
    ffi.Pointer<wire_uint_8_list> engine_path,
  ) {
    return _wire_subscribe_ucci_engine(
      port_,
      player,
      engine_path,
    );
  }

  late final _wire_subscribe_ucci_enginePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Int32,
              ffi.Pointer<wire_uint_8_list>)>>('wire_subscribe_ucci_engine');
  late final _wire_subscribe_ucci_engine = _wire_subscribe_ucci_enginePtr
      .asFunction<void Function(int, int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_write_to_process(
    int port_,
    ffi.Pointer<wire_uint_8_list> command,
    int msec,
    int player,
    ffi.Pointer<wire_uint_8_list> check_str_option,
  ) {
    return _wire_write_to_process(
      port_,
      command,
      msec,
      player,
      check_str_option,
    );
  }

  late final _wire_write_to_processPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Uint32,
              ffi.Int32,
              ffi.Pointer<wire_uint_8_list>)>>('wire_write_to_process');
  late final _wire_write_to_process = _wire_write_to_processPtr.asFunction<
      void Function(int, ffi.Pointer<wire_uint_8_list>, int, int,
          ffi.Pointer<wire_uint_8_list>)>();

  void wire_is_process_loaded(
    int port_,
    int msec,
    int player,
  ) {
    return _wire_is_process_loaded(
      port_,
      msec,
      player,
    );
  }

  late final _wire_is_process_loadedPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Uint32, ffi.Int32)>>('wire_is_process_loaded');
  late final _wire_is_process_loaded =
      _wire_is_process_loadedPtr.asFunction<void Function(int, int, int)>();

  void wire_is_process_unloaded(
    int port_,
    int msec,
    int player,
  ) {
    return _wire_is_process_unloaded(
      port_,
      msec,
      player,
    );
  }

  late final _wire_is_process_unloadedPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Uint32, ffi.Int32)>>('wire_is_process_unloaded');
  late final _wire_is_process_unloaded =
      _wire_is_process_unloadedPtr.asFunction<void Function(int, int, int)>();

  void wire_get_engine_name(
    int port_,
    int player,
  ) {
    return _wire_get_engine_name(
      port_,
      player,
    );
  }

  late final _wire_get_engine_namePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64, ffi.Int32)>>(
          'wire_get_engine_name');
  late final _wire_get_engine_name =
      _wire_get_engine_namePtr.asFunction<void Function(int, int)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_1(
    int len,
  ) {
    return _new_uint_8_list_1(
      len,
    );
  }

  late final _new_uint_8_list_1Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list_1');
  late final _new_uint_8_list_1 = _new_uint_8_list_1Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();
}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
