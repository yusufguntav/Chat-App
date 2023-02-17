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
    this.isSignUp = false,
  });
  String headerText;
  String heroTag;
  bool isSignUp;
  static String username = '';
  static String email = '';
  static String password = '';
  Widget heroWidget;
  Future Function() signButtonOnPress;

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool isLogin = false;
  bool _absorbing = false;

  _RequiredField() {
    if (!widget.isSignUp) {
      if (SignPage.email.isNotEmpty && SignPage.password.isNotEmpty) {
        setState(
          () {
            _absorbing = false;
          },
        );
      } else {
        setState(
          () {
            _absorbing = true;
          },
        );
      }
    } else {
      if (SignPage.email.isNotEmpty &&
          SignPage.password.isNotEmpty &&
          SignPage.username.isNotEmpty) {
        setState(
          () {
            _absorbing = false;
          },
        );
      } else {
        setState(
          () {
            _absorbing = true;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isLogin,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Header(text: widget.headerText),
                (widget.isSignUp)
                    ? TextBox(
                        onChanged: (String value) {
                          SignPage.username = value;
                          _RequiredField();
                        },
                        hintText: 'Enter your username*',
                      )
                    : const SizedBox(),
                TextBox(
                  onChanged: (String value) {
                    SignPage.email = value;
                    _RequiredField();
                  },
                  isMailAdress: true,
                  hintText: 'Enter your mail*',
                ),
                TextBox(
                  onChanged: (String value) {
                    SignPage.password = value;
                    _RequiredField();
                  },
                  hintText: 'Enter your password*',
                  isPassword: true,
                ),
                Hero(
                  tag: widget.heroTag,
                  child: CustomButton(
                    absorbing: _absorbing,
                    buttonBackgroundColor: kButtonBackgroundColor,
                    widget: widget.heroWidget,
                    onPress: () async {
                      setState(
                        () => isLogin = true,
                      );
                      try {
                        await widget.signButtonOnPress();
                        setState(
                          () => isLogin = false,
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
