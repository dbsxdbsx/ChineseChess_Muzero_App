// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated_shared.io.dart'
    if (dart.library.html) 'bridge_generated_shared.web.dart';
import 'bridge_generated_shared.dart';
export 'bridge_generated_shared.dart';
import 'bridge_generated_shared.io.dart'
    if (dart.library.html) 'bridge_generated_shared.web.dart';

class BridgeGeneratedSharedImpl implements BridgeGeneratedShared {
  final BridgeGeneratedSharedPlatform _platform;
  factory BridgeGeneratedSharedImpl(ExternalLibrary dylib) =>
      BridgeGeneratedSharedImpl.raw(BridgeGeneratedSharedPlatform(dylib));
  BridgeGeneratedSharedImpl.raw(this._platform);

  /// Only valid on web/WASM platforms.
  factory BridgeGeneratedSharedImpl.wasm(FutureOr<WasmModule> module) =>
      BridgeGeneratedSharedImpl(module as ExternalLibrary);

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String wire2api_String(dynamic raw) {
    return raw as String;
  }

  bool wire2api_bool(dynamic raw) {
    return raw as bool;
  }

  int wire2api_i32(dynamic raw) {
    return raw as int;
  }

  int wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }

  void wire2api_unit(dynamic raw) {
    return;
  }
}

// Section: api2wire

@protected
int api2wire_i32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer
