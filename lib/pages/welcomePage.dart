import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/assets/constants.dart';
import 'package:chat_app/pages/staticPageNames.dart';
import 'package:chat_app/widgets/signButton.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              animatedHeader(),
              SignButton(
                heroTag: 'SignInButton',
                label: 'Sign in',
                pageName: PageNames.loginPage,
              ),
              Text(
                'or',
                textAlign: TextAlign.center,
                style: kHeaderTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              SignButton(
                heroTag: 'SignUpButton',
                label: 'Sign up',
                pageName: PageNames.registerPage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedTextKit animatedHeader() {
    return AnimatedTextKit(
      repeatForever: true,
      pause: const Duration(milliseconds: 500),
      animatedTexts: [
        TypewriterAnimatedText(
          'Welcome!',
          textAlign: TextAlign.center,
          textStyle: kHeaderTextStyle,
          speed: const Duration(
            milliseconds: 500,
          ),
        ),
      ],
    );
  }
}
