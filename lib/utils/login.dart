// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/widgets/CustomAlert.dart';
import 'package:chat_app/widgets/signPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/loadingPage.dart';
import '../pages/staticPageNames.dart';
import 'createUserModel.dart';

Future login(BuildContext context) async {
  final firebaseAuth = FirebaseAuth.instance;
  try {
    await firebaseAuth.signInWithEmailAndPassword(
        email: SignPage.email, password: SignPage.password);
    SignPage.email = '';
    SignPage.password = '';
    currentUserModel = await createUserModel();

    Navigator.pushNamed(context, PageNames.homePage);
  } catch (e) {
    CustomAlert(context, 'Warning!',
            'The email and password you entered did not match our records.')
        .show();
    debugPrint(
      e.toString(),
    );
  }
}
