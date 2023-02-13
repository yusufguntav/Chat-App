import 'package:chat_app/assets/constants.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/textBox.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../widgets/customButton.dart';
import '../widgets/header.dart';

class SignPage extends StatefulWidget {
  SignPage({
    super.key,
    required this.signButtonOnPress,
    required this.headerText,
    required this.heroTag,
    required this.heroWidget,
  });
  String headerText;
  String heroTag;
  static String email = '';
  static String password = '';
  Widget heroWidget;
  Future Function() signButtonOnPress;

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLoading,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Header(text: widget.headerText),
                TextBox(
                  onChanged: ((String value) => SignPage.email = value),
                  isMailAdress: true,
                  hintText: 'Enter your mail',
                ),
                TextBox(
                  onChanged: ((String value) => SignPage.password = value),
                  hintText: 'Enter your password',
                  isPassword: true,
                ),
                Hero(
                  tag: widget.heroTag,
                  child: CustomButton(
                    buttonBackgroundColor: kButtonBackgroundColor,
                    widget: widget.heroWidget,
                    onPress: () async {
                      setState(
                        () => isLoading = true,
                      );
                      try {
                        await widget.signButtonOnPress();
                        setState(
                          () => isLoading = false,
                        );
                      } catch (e) {
                        debugPrint(
                          e.toString(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
