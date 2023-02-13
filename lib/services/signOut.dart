import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/staticPageNames.dart';

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut().then(
        (value) => Navigator.popAndPushNamed(
          context,
          PageNames.welcomePage,
        ),
      );
}
