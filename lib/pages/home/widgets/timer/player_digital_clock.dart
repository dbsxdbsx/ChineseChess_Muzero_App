import 'package:chinese_chess_alpha_zero/bridge_definitions.dart';
import 'package:flutter/material.dart';

import '../../lib.dart';
import 'digital_font/digital_colon.dart';
import 'digital_font/digital_number.dart';

class PlayerDigitalClock extends GetView<HomeController> {
  double outerRoundRadius;
  late double innerRoundRadius;
  final _innerOuterRadiusRatio = 10 / 15;

  late final Rx<DigitTimeController> _timeController;

  PlayerDigitalClock(Player player, this.outerRoundRadius, {Key? key})
      : super(key: key) {
    // ui radius
    innerRoundRadius = _innerOuterRadiusRatio * outerRoundRadius;

    switch (player) {
      case Player.Red:
        _timeController = controller.redTimeController;
        break;
      case Player.Black:
        _timeController = controller.blackTimeController;
        break;
      default:
        throw Exception('Player is not Red or Black, Something went wrong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      // Outer white container
      decoration: BoxDecoration(
        // color: Color.fromRGBO(217, 230, 243, 1),
        borderRadius: BorderRadius.circular(outerRoundRadius),
        // boxShadow: const [
        //   BoxShadow(
        //     blurRadius: 15,
        //     offset: Offset(-5, -5),
        //     color: Colors.white,
        //   ),
        //   BoxShadow(
        //     blurRadius: 15,
        //     offset: Offset(10.5, 10.5),
        //     color: Color.fromRGBO(214, 223, 230, 1),
        //   )
        // ],
      ),
      // Digital green background
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: constraints.maxHeight * 0.87,
            width: constraints.maxWidth * 0.95,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(203, 211, 196, 1),
                Color.fromRGBO(176, 188, 163, 1)
              ]),
              borderRadius: BorderRadius.circular(innerRoundRadius),
              border: Border.all(
                color: const Color.fromRGBO(168, 168, 168, 1),
                width: 2,
              ),
            ),
            child: Obx(
              () => DigitalClock(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                seconds: _timeController.value.inSeconds,
                minutes: _timeController.value.inMinutes,
                hours: _timeController.value.inHours,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    super.key,
    required this.height,
    required this.width,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
  });

  final num height;
  final num width;
  final int hours;
  final int minutes;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    List<DigitalNumberWithBG> hourNumber = createNumberTime(hours);
    List<DigitalNumberWithBG> minuteNumber = createNumberTime(minutes);
    List<DigitalNumberWithBG> secondNumber = createNumberTime(seconds);
    return Center(
      child: SizedBox(
        // color: Colors.green, //数字的颜色
        height: height * 1.0, // 0.47,
        width: width * 0.6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...hourNumber,
            DigitalColon(height: height * 0.50, color: Colors.black87),
            ...minuteNumber,
            DigitalColon(height: height * 0.50, color: Colors.black87),
            ...secondNumber,
          ],
        ),
      ),
    );
  }

  List<DigitalNumberWithBG> createNumberTime(int numberTime) {
    final parsedNumberTime = numberTime % 60;
    final isNumberTimeTwoDigits = isNumberTwoDigits(parsedNumberTime);
    final firstNumber = firstDigit(parsedNumberTime);
    final tenDigit = isNumberTimeTwoDigits ? firstNumber : 0;
    final digit = isNumberTimeTwoDigits
        ? int.parse(parsedNumberTime.toString()[1])
        : firstNumber;

    return [
      DigitalNumberWithBG(
        height: height * 0.35,
        value: tenDigit,
      ),
      DigitalNumberWithBG(
        height: height * 0.35,
        value: digit,
      ),
    ];
  }
}

class DigitalNumberWithBG extends StatelessWidget {
  const DigitalNumberWithBG({
    super.key,
    this.value = 0,
    // required this.padLeft,
    required this.height,
    // required this.color,
    this.backgroundValue = 8,
  });

  final int value;
  final int backgroundValue;
  // final int padLeft;
  final double height;
  // final Color color;

  final numberScaleRatio = 1.4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Foreground(数字本身的颜色)
        DigitalNumber(
          value: value,
          color: Colors.black,
          height: height * numberScaleRatio,
        ),

        // Background
        DigitalNumber(
          value: backgroundValue,
          color: Colors.black12,
          height: height * numberScaleRatio,
        ),
      ],
    );
  }
}

bool isNumberTwoDigits(int number) {
  return number.toString().length == 2;
}

int firstDigit(int number) {
  return int.parse(number.toString()[0]);
}
