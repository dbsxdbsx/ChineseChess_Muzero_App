// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.79.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const
import 'bridge_generated_shares.io.dart'
    if (dart.library.html) 'bridge_generated_shares.web.dart';
import 'dart:async';
import 'dart:convert';
import 'gened_rule_api.io.dart'
    if (dart.library.html) 'gened_rule_api.web.dart';
import 'gened_ucci_api.io.dart'
    if (dart.library.html) 'gened_ucci_api.web.dart';
import 'gened_util_api.io.dart'
    if (dart.library.html) 'gened_util_api.web.dart';
import 'package:collection/collection.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

abstract class BridgeGeneratedShares {}

abstract class UtilApi {
  Future<Platform> platform({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kPlatformConstMeta;

  Future<bool> rustReleaseMode({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kRustReleaseModeConstMeta;

  Future<void> activate({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kActivateConstMeta;
}

enum Platform {
  Unknown,
  Android,
  Ios,
  Windows,
  Unix,
  MacIntel,
  MacApple,
  Wasm,
}

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
  Unknown,
}

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
