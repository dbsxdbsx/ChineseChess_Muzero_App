// TODO: not support latest frb
// import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

// import 'gened_util_api.dart';
// import 'dart:ffi' as ffi;

// class UtilApiImplExtend extends UtilApiImpl with FlutterRustBridgeSetupMixin {
//   factory UtilApiImplExtend(ffi.DynamicLibrary dylib) =>
//       UtilApiImplExtend._raw(UtilApiWire(dylib));

//   UtilApiImplExtend._raw(super.inner) : super.raw() {
//     setupMixinConstructor();
//   }

//   @override
//   Future<void> setup() async {
//     await rustSetUp(hint: FlutterRustBridgeSetupMixin.kHintSetup);
//   }
// }
