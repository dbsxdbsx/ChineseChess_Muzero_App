import 'package:flutter/material.dart';

/// Example to show how to popup overlay with custom animation.
class CustomAnimationToast extends StatelessWidget {
  final double value;
  final String message;

  static final Tween<Offset> tweenOffset =
      Tween<Offset>(begin: const Offset(0, 40), end: const Offset(0, 0));

  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);

  const CustomAnimationToast(
      {Key? key, required this.value, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: tweenOffset.transform(value),
      child: Opacity(
        opacity: tweenOpacity.transform(value),
        child: IosStyleToast(message),
      ),
    );
  }
}

class IosStyleToast extends StatelessWidget {
  String message;

  IosStyleToast(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.black87,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(
                    //  null,
                    //   // Icons.check,
                    //   color: Colors.white,
                    // ),
                    Text(message)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
