import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:window_manager/window_manager.dart';

import 'common/global.dart';
import 'common/route/route.dart';

void main() async {
  // utilApi.activate();  // TODO: not support latest frb
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      await windowManager.setTitle("梦入零式");
      await windowManager.setSize(const Size(appWidth, appHeight));
      await windowManager.setAspectRatio(appWidth / appHeight);
      await windowManager.setMinimizable(true);
      await windowManager.setMinimumSize(
          const Size(appWidth * minSizeScale, appHeight * minSizeScale));
      await windowManager.setMaximumSize(
          const Size(appWidth * maxSizeScale, appHeight * maxSizeScale));
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
      await windowManager.setResizable(true);

      await windowManager.center();
      await windowManager.focus();
      await windowManager.show();

      runApp(
        OverlaySupport.global(
          child: GetMaterialApp(
            getPages: AppPages.pages,
            initialRoute: Routes.home,
          ),
        ),
      );
    });
  }
}
