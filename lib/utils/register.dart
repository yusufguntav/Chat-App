import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/staticPageNames.dart';

Future createUser(BuildContext context, String email, String password) async {
  final _firebaseAuth = FirebaseAuth.instance;

  try {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
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
