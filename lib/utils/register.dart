import 'package:chat_app/services/createUser.dart';
import 'package:chat_app/widgets/signPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/loadingPage.dart';
import '../pages/staticPageNames.dart';
import 'createUserModel.dart';

void _CreateStages() async {
  final firebaseauth = FirebaseAuth.instance;
  await firebaseauth.createUserWithEmailAndPassword(
      email: SignPage.email, password: SignPage.password);

  await createUser(firebaseauth.currentUser!.email.toString(),
      firebaseauth.currentUser!.uid, SignPage.username);

  currentUserModel = await createUserModel();
}

Future register(BuildContext context) async {
  try {
    _CreateStages();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          'User created',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    Navigator.pushNamed(context, PageNames.homePage);
  } catch (e) {
    debugPrint(
      e.toString(),
    );
  }
}
