import 'package:chat_app/widgets/signPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/staticPageNames.dart';

Future login(BuildContext context) async {
  final _firebaseAuth = FirebaseAuth.instance;
  try {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: SignPage.email, password: SignPage.password);
    SignPage.email = '';
    SignPage.password = '';

    Navigator.pushNamed(context, PageNames.homePage);
  } catch (e) {
    debugPrint(
      e.toString(),
    );
  }
}
