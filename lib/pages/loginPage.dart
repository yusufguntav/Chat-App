import 'package:chat_app/utils/login.dart';
import 'package:chat_app/widgets/signPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SignPage(
      signButtonOnPress: () => login(context),
      headerText: 'Sign in',
      heroTag: 'SignInButton',
      heroWidget: const Text('Sign in'),
    );
  }
}
