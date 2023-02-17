import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.widget,
    required this.onPress,
    this.absorbing = false,
    this.buttonBackgroundColor,
  });
  bool absorbing;
  Color? buttonBackgroundColor;
  Function() onPress;
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: AbsorbPointer(
        absorbing: absorbing,
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: buttonBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 20,
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}
