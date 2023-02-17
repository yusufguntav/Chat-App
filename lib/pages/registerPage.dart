import 'package:chat_app/services/isUsernameTaken.dart';
import 'package:chat_app/utils/register.dart';
import 'package:chat_app/widgets/signPage.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomAlert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SignPage(
      isSignUp: true,
      signButtonOnPress: () async {
        if (!await isUsernameTaken(SignPage.username)) {
          return register(context);
        } else {
          CustomAlert(context, 'Warning!', 'Username taken').show();
        }
      },
      headerText: 'Sign up',
      heroTag: 'SignUpButton',
      heroWidget: const Text('Sign up'),
    );
  }
}
