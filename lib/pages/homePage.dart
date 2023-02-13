import 'package:chat_app/assets/constants.dart';
import 'package:chat_app/services/signOut.dart';
import 'package:chat_app/widgets/customButton.dart';
import 'package:chat_app/widgets/header.dart';
import 'package:chat_app/widgets/textBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Header(
                        text: 'Welcome!',
                      ),
                      Header(
                        text:
                            FirebaseAuth.instance.currentUser!.email.toString(),
                        headerSize: HeaderSize.headerMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextBox(
                        hintText: 'ysf@gmail.com',
                      ),
                      Header(
                        text:
                            'info: Enter the email address of the person you want to talk',
                        headerSize: HeaderSize.headerSmall,
                      ),
                      CustomButton(
                        buttonBackgroundColor: kButtonBackgroundColor,
                        widget: Header(
                          text: 'Start Chat!',
                          headerSize: HeaderSize.headerMedium,
                        ),
                        onPress: () {},
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
