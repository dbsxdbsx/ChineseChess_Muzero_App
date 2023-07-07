/*
 * @Author       : 老董
 * @Date         : 2022-07-21 09:49:11
 * @LastEditors  : 老董
 * @LastEditTime : 2023-07-07 13:54:52
 * @Description  : player panel中那个“电脑图标”的按钮，用以加载引擎
 */
import 'package:chinese_chess_alpha_zero/bridge_definitions.dart';
import 'package:chinese_chess_alpha_zero/common/global.dart';
import 'package:chinese_chess_alpha_zero/common/widgets/toast/toast_message.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../../lib.dart';

class EngineLoadButton extends GetView<HomeController> {
  // MyButton({required this.player, required this.pullDownUi, Key? key})
  double _distance = 0.0;
  double _blur = 0.0;
  bool _isInSet = false;
  late final double _containerSize;
  late final double _radius;
  late final double _iconSize;
  late final IconData _icon;
  final double _containerIconRatio = 104 / 75;
  final double _radiusContainerRatio = 27 / 104;
  final double _deepPressDistanceContianerRatio = 17 / 104;
  final double _middlePressDistanceContianerRatio = 10.5 / 104;
  final double _noPressDistanceContianerRatio = 11 / 104;
  late final Color _iconColor;
  Player player;
  final _buttonState = NeumorphicButtonState.noPressed.obs;

  EngineLoadButton(
      {required this.player,
      required IconData iconData,
      required double iconSize,
      Key? key})
      : _iconSize = iconSize,
        _icon = iconData,
        super(key: key) {
    _containerSize = _containerIconRatio * _iconSize;
    _radius = _radiusContainerRatio * _containerSize;

    switch (player) {
      case Player.Red:
        _iconColor = Colors.red;
        break;
      case Player.Black:
        _iconColor = Colors.black;
        break;
      default:
        throw Exception('Player is not Red or Black, Something went wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        // debugPrint("触发onTapCancel");
        // 当触发onTapDown并拖动时，会触发此trigger
        _buttonState.value = NeumorphicButtonState.noPressed;
      },
      onTapDown: (_) {
        debugPrint("触发onTapDown");
        _buttonState.value = NeumorphicButtonState.deepPressed;
      },
      onTapUp: (posDetails) async {
        debugPrint("触发onTapUp");
        if (controller.getEngineLoaded(player)) {
          //卸载引擎流程
          await controller.onUnloadEngine(player);
        } else {
          //加载引擎流程
          String? enginePath;
          if (controller.isEnginesEmpty()) {
            // 1.无引擎加载情况下，弹出文件选择窗口
            enginePath = await getPickedFile();
            if (enginePath == null) {
              toast("引擎目录读取错误");
              _buttonState.value = NeumorphicButtonState.noPressed;
              return;
            }
          } else {
            // 2.有引擎情况下，弹出右键菜单，让用户选择是加载新引擎路径还是选择已有的引擎（在菜单中显示）
            // showPopUpMenuAtPosition(context, details);
            debugPrint("将打开右键菜单");

            var customAddEngineStr = "加载自定义引擎";
            final choice = await showEngineMenu(context, posDetails,
                <String>[customAddEngineStr, ...controller.enginePathMap.keys]);
            if (choice == null) {
              _buttonState.value = NeumorphicButtonState.noPressed;
              return;
            }
            if (choice == customAddEngineStr) {
              // 加载自定义引擎
              enginePath = await getPickedFile();
              if (enginePath == null) {
                toast("引擎目录读取错误");
                _buttonState.value = NeumorphicButtonState.noPressed;
                return;
              }
            } else {
              // 选择已有路径的引擎
              enginePath = controller.enginePathMap[choice];
            }
          }
          //根据路径加载引擎
          await controller.onLoadEngine(enginePath!, player);
        }
        // 根据引擎的状态结果设置ui样式
        controller.getEngineLoaded(player)
            ? _buttonState.value = NeumorphicButtonState.middlePressed
            : _buttonState.value = NeumorphicButtonState.noPressed;
      },
      child: Obx(
        () {
          switch (_buttonState.value) {
            case NeumorphicButtonState.deepPressed:
              _distance = _deepPressDistanceContianerRatio * _containerSize;
              _blur = 3.0;
              _isInSet = true;
              break;
            case NeumorphicButtonState.middlePressed:
              _distance = _middlePressDistanceContianerRatio * _containerSize;
              _blur = 3.0;
              _isInSet = true;
              break;
            case NeumorphicButtonState.noPressed:
              _distance = _noPressDistanceContianerRatio * _containerSize;
              _blur = 6.0;
              _isInSet = false;
              break;
            default:
              throw "NeumorphicButton未知buttonState";
          }

          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: _containerSize,
            height: _containerSize,
            decoration: BoxDecoration(
              // color: const Color(0xff292d32),
              // color: Color.fromARGB(255, 4, 239, 118),
              borderRadius: BorderRadius.circular(_radius),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // container的底色
                colors: [
                  // Color(0xff090d12),
                  // Color(0xff494d52),
                  Colors.white,
                  Colors.white70,
                ],
              ),
              boxShadow: [
                // 左上角阴影
                BoxShadow(
                  color: const Color(0xff494d52),
                  // color: Color.fromARGB(255, 3, 102, 255),
                  offset: Offset(-_distance * 0.3, -_distance * 0.15),
                  blurRadius: _blur,
                  spreadRadius: 0.0,
                  inset: _isInSet,
                ),
                // 左下角阴影
                BoxShadow(
                  color: const Color(0xff090d12),
                  // color: Color.fromARGB(255, 6, 36, 72),
                  offset: Offset(_distance, _distance),
                  blurRadius: _blur,
                  spreadRadius: 0.0,
                  inset: _isInSet,
                ),
              ],
            ),
            child: Icon(
              _icon,
              size: _iconSize,
              color: _iconColor,
            ),
          );
        },
      ),
    );
  }

  //test
  // https://stackoverflow.com/questions/63086049/display-pop-up-menu-when-icon-button-widget-is-clicked-flutter
  Future<String?> showEngineMenu(BuildContext context, TapUpDetails details,
      List<String> menuItems) async {
    final items = [];
    for (var i = 0; i < menuItems.length; i++) {
      items.add(
        PopupMenuItem<String>(
          value: menuItems[i],
          child: Row(
            children: [
              const Icon(Icons.star),
              const SizedBox(
                width: 25,
              ),
              Text(menuItems[i])
            ],
          ),
        ),
        // PopupMenuItem<String>(value: menuItems[i], child: Text(menuItems[i])),
      );
    }
    //
    return await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx - 1000,
        details.globalPosition.dy,
      ),
      items: [
        ...items
        // PopupMenuItem<String>(child: const Text('menu option 1'), value: '1'),
        // PopupMenuItem<String>(child: const Text('menu option 2'), value: '2'),
        // PopupMenuItem<String>(child: const Text('menu option 3'), value: '3'),
      ],
      color: Colors.grey,
      // elevation: 2,
    );
  }

  Future<String?> getPickedFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['exe'],
    );
    if (result == null) {
      return null;
    }
    return result.files.single.path!;
  }
}
