// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.75.3.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';

import 'package:collection/collection.dart';
import 'bridge_generated_shares.dart';
export 'bridge_generated_shares.dart';
import 'bridge_generated_shares.io.dart';
import 'dart:ffi' as ffi;

abstract class RuleApi {
  Future<void> testLog1({required String log, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kTestLog1ConstMeta;

  Future<void> testPrint1({required String log, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kTestPrint1ConstMeta;

  Future<bool> isLegalMove(
      {required int srcRow,
      required int srcCol,
      required int dstRow,
      required int dstCol,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kIsLegalMoveConstMeta;

  Future<U8Array256> getOrigBoard({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetOrigBoardConstMeta;

  Future<void> updateBoardData(
      {required int row,
      required int col,
      required int pieceIndex,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kUpdateBoardDataConstMeta;

  Future<void> updatePlayerData({required String player, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kUpdatePlayerDataConstMeta;
}

class U8Array256 extends NonGrowableListView<int> {
  static const arraySize = 256;
  U8Array256(Uint8List inner)
      : assert(inner.length == arraySize),
        super(inner);
  U8Array256.unchecked(Uint8List inner) : super(inner);
  U8Array256.init() : super(Uint8List(arraySize));
}

class RuleApiImpl implements RuleApi {
  final RuleApiPlatform _platform;
  final BridgeGeneratedSharesPlatform _sharedPlatform;
  final BridgeGeneratedSharesImpl _sharedImpl;

  factory RuleApiImpl(ExternalLibrary dylib) {
    final platform = RuleApiPlatform(dylib);
    final sharedPlatform = BridgeGeneratedSharesPlatform(dylib);
    final sharedImpl = BridgeGeneratedSharesImpl(dylib);
    return RuleApiImpl.raw(platform, sharedPlatform, sharedImpl);
  }

  RuleApiImpl.raw(this._platform, this._sharedPlatform, this._sharedImpl);

  /// Only valid on web/WASM platforms.
  factory RuleApiImpl.wasm(FutureOr<WasmModule> module) =>
      RuleApiImpl(module as ExternalLibrary);

  Future<void> testLog1({required String log, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(log);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_log_1(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_unit,
      constMeta: kTestLog1ConstMeta,
      argValues: [log],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestLog1ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_log_1",
        argNames: ["log"],
      );

  Future<void> testPrint1({required String log, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(log);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_test_print_1(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_unit,
      constMeta: kTestPrint1ConstMeta,
      argValues: [log],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kTestPrint1ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "test_print_1",
        argNames: ["log"],
      );

  Future<bool> isLegalMove(
      {required int srcRow,
      required int srcCol,
      required int dstRow,
      required int dstCol,
      dynamic hint}) {
    var arg0 = api2wire_u8(srcRow);
    var arg1 = api2wire_u8(srcCol);
    var arg2 = api2wire_u8(dstRow);
    var arg3 = api2wire_u8(dstCol);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_is_legal_move(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _sharedImpl.wire2api_bool,
      constMeta: kIsLegalMoveConstMeta,
      argValues: [srcRow, srcCol, dstRow, dstCol],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kIsLegalMoveConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "is_legal_move",
        argNames: ["srcRow", "srcCol", "dstRow", "dstCol"],
      );

  Future<U8Array256> getOrigBoard({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_get_orig_board(port_),
      parseSuccessData: _wire2api_u8_array_256,
      constMeta: kGetOrigBoardConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetOrigBoardConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_orig_board",
        argNames: [],
      );

  Future<void> updateBoardData(
      {required int row,
      required int col,
      required int pieceIndex,
      dynamic hint}) {
    var arg0 = api2wire_u8(row);
    var arg1 = api2wire_u8(col);
    var arg2 = api2wire_u8(pieceIndex);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_update_board_data(port_, arg0, arg1, arg2),
      parseSuccessData: _sharedImpl.wire2api_unit,
      constMeta: kUpdateBoardDataConstMeta,
      argValues: [row, col, pieceIndex],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kUpdateBoardDataConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "update_board_data",
        argNames: ["row", "col", "pieceIndex"],
      );

  Future<void> updatePlayerData({required String player, dynamic hint}) {
    var arg0 = _sharedPlatform.api2wire_String(player);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_update_player_data(port_, arg0),
      parseSuccessData: _sharedImpl.wire2api_unit,
      constMeta: kUpdatePlayerDataConstMeta,
      argValues: [player],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kUpdatePlayerDataConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "update_player_data",
        argNames: ["player"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  U8Array256 _wire2api_u8_array_256(dynamic raw) {
    return U8Array256(_wire2api_uint_8_list(raw));
  }
}

// Section: api2wire

// Section: finalizer

class RuleApiPlatform extends FlutterRustBridgeBase<RuleApiWire> {
  final BridgeGeneratedSharesPlatform _sharedPlatform;
  RuleApiPlatform(ffi.DynamicLibrary dylib)
      : _sharedPlatform = BridgeGeneratedSharesPlatform(dylib),
        super(RuleApiWire(dylib));

// Section: api2wire

// Section: finalizer

// Section: api_fill_to_wire
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class RuleApiWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RuleApiWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RuleApiWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

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

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(uintptr_t)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(uintptr_t)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<uintptr_t Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_test_log_1(
    int port_,
    ffi.Pointer<wire_uint_8_list> log,
  ) {
    return _wire_test_log_1(
      port_,
      log,
    );
  }

  late final _wire_test_log_1Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_test_log_1');
  late final _wire_test_log_1 = _wire_test_log_1Ptr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_test_print_1(
    int port_,
    ffi.Pointer<wire_uint_8_list> log,
  ) {
    return _wire_test_print_1(
      port_,
      log,
    );
  }

  late final _wire_test_print_1Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_test_print_1');
  late final _wire_test_print_1 = _wire_test_print_1Ptr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_is_legal_move(
    int port_,
    int src_row,
    int src_col,
    int dst_row,
    int dst_col,
  ) {
    return _wire_is_legal_move(
      port_,
      src_row,
      src_col,
      dst_row,
      dst_col,
    );
  }

  late final _wire_is_legal_movePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Uint8, ffi.Uint8, ffi.Uint8,
              ffi.Uint8)>>('wire_is_legal_move');
  late final _wire_is_legal_move = _wire_is_legal_movePtr
      .asFunction<void Function(int, int, int, int, int)>();

  void wire_get_orig_board(
    int port_,
  ) {
    return _wire_get_orig_board(
      port_,
    );
  }

  late final _wire_get_orig_boardPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_get_orig_board');
  late final _wire_get_orig_board =
      _wire_get_orig_boardPtr.asFunction<void Function(int)>();

  void wire_update_board_data(
    int port_,
    int row,
    int col,
    int piece_index,
  ) {
    return _wire_update_board_data(
      port_,
      row,
      col,
      piece_index,
    );
  }

  late final _wire_update_board_dataPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Uint8, ffi.Uint8,
              ffi.Uint8)>>('wire_update_board_data');
  late final _wire_update_board_data = _wire_update_board_dataPtr
      .asFunction<void Function(int, int, int, int)>();

  void wire_update_player_data(
    int port_,
    ffi.Pointer<wire_uint_8_list> player,
  ) {
    return _wire_update_player_data(
      port_,
      player,
    );
  }

  late final _wire_update_player_dataPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_update_player_data');
  late final _wire_update_player_data = _wire_update_player_dataPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list(
    int len,
  ) {
    return _new_uint_8_list(
      len,
    );
  }

  late final _new_uint_8_listPtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list');
  late final _new_uint_8_list = _new_uint_8_listPtr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

class _Dart_Handle extends ffi.Opaque {}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<ffi.Bool Function(DartPort, ffi.Pointer<ffi.Void>)>>;
typedef DartPort = ffi.Int64;
typedef uintptr_t = ffi.UnsignedLongLong;
