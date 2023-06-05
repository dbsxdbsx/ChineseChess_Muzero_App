// This file initializes the dynamic library and connects it with the stub
// generated by flutter_rust_bridge_codegen.

import 'dart:ffi';
import 'dart:io' as io;

import 'bridge_definitions.dart';
import 'gened_rule_api.dart';
import 'gened_ucci_api.dart';

const _base = 'native';

// On MacOS, the dynamic library is not bundled with the binary,
// but rather directly **linked** against the binary.
final _dylib = io.Platform.isWindows ? '$_base.dll' : 'lib$_base.so';

// The late modifier delays initializing the value until it is actually needed,
// leaving precious little time for the program to quickly start up.
// TODO: not support latest frb
// final UtilApi utilApi = UtilApiImplExtend(
//     io.Platform.isIOS || io.Platform.isMacOS
//         ? DynamicLibrary.executable()
//         : DynamicLibrary.open(_dylib));

final RuleApi ruleApi = RuleApiImpl(io.Platform.isIOS || io.Platform.isMacOS
    ? DynamicLibrary.executable()
    : DynamicLibrary.open(_dylib));

final UcciApi ucciApi = UcciApiImpl(io.Platform.isIOS || io.Platform.isMacOS
    ? DynamicLibrary.executable()
    : DynamicLibrary.open(_dylib));

final apiShare = BridgeGeneratedSharesImpl(
    io.Platform.isIOS || io.Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(_dylib));
