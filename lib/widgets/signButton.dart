import 'package:chat_app/assets/constants.dart';
import 'package:flutter/material.dart';

import 'customButton.dart';

class SignButton extends StatelessWidget {
  SignButton({
    super.key,
    required this.heroTag,
    required this.label,
    required this.pageName,
  });
  String heroTag;
  String label;
  String pageName;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: CustomButton(
        buttonBackgroundColor: kButtonBackgroundColor,
        widget: Text(label),
        onPress: () {
          Navigator.pushNamed(
            context,
            pageName,
          );
        },
      ),
    );
  }
}
