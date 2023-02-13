import 'package:chat_app/utils/register.dart';
import 'package:chat_app/widgets/signPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SignPage(
      signButtonOnPress: () =>
          createUser(context, SignPage.email, SignPage.password),
      headerText: 'Sign up',
      heroTag: 'SignUpButton',
      heroWidget: const Text('Sign up'),
    );
  }
}
