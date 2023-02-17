import 'package:chat_app/assets/constants.dart';
import 'package:chat_app/pages/loadingPage.dart';
import 'package:chat_app/pages/staticPageNames.dart';
import 'package:chat_app/services/isUsernameTaken.dart';
import 'package:chat_app/services/signOut.dart';
import 'package:chat_app/utils/createUserModel.dart';
import 'package:chat_app/widgets/CustomAlert.dart';
import 'package:chat_app/widgets/customButton.dart';
import 'package:chat_app/widgets/header.dart';
import 'package:chat_app/widgets/signPage.dart';
import 'package:chat_app/widgets/textBox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Header(
                        text: 'Welcome!',
                      ),
                      Header(
                        text:
                            'Enter the username of the person you want to talk',
                        headerSize: HeaderSize.headerSmall,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextBox(
                        controller: _textEditingController,
                        hintText: 'yusufguntav',
                      ),
                      CustomButton(
                        buttonBackgroundColor: kButtonBackgroundColor,
                        widget: Header(
                          text: 'Start Chat!',
                          headerSize: HeaderSize.headerMedium,
                        ),
                        onPress: () async {
                          if (!await isUsernameTaken(
                              _textEditingController.text)) {
                            return CustomAlert(context, 'Warning!',
                                    'You have entered an invalid username. Please try again.')
                                .show();
                          }
                          otherUserModel = await createOtherUserModel(
                              _textEditingController.text);
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, PageNames.chatPage);
                        },
                      ),
                      CustomButton(
                        buttonBackgroundColor: Colors.red.shade400,
                        widget: Header(
                          text: 'Sign Out',
                          headerSize: HeaderSize.headerSmall,
                        ),
                        onPress: () async => await signOut(
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
