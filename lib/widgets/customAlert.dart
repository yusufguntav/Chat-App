import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../assets/constants.dart';

Alert CustomAlert(BuildContext context, String title, String desc) {
  return Alert(
    context: context,
    title: title,
    desc: desc,
    style: const AlertStyle(backgroundColor: Colors.white),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        width: 120,
        color: kButtonBackgroundColor,
        child: const Text(
          "Ok",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  );
}
