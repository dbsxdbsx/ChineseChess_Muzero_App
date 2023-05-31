import 'package:flutter/material.dart';

void getSettingSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          child: Column(
            children: [
              const Text(
                '全局设置',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Row(
                children: [
// 引擎1设置
                  _getEngineSettingsWidget(isRedSide: true),
                  // 引擎2设置
                  _getEngineSettingsWidget(isRedSide: false),
                ],
              ),
            ],
          ),
        );
      });
}

Widget _getEngineSettingsWidget({required bool isRedSide}) {
  bool selected = false;
  return const Column(children: [
    // Text('x')
    // 每步固定时间/深度模式
    // MacosSwitch(
    //   value: selected,
    //   onChanged: (value) {
    //     // setState(() => selected = value);
    //   },
    // ),
    // 全局限时模式
  ]);
}
