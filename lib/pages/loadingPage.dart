import 'package:chat_app/pages/staticPageNames.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/userModel.dart';
import '../utils/createUserModel.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

userModel currentUserModel = userModel('', '', '');
userModel otherUserModel = userModel('', '', '');

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    startApp();
  }

  dynamic startApp() {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushNamed(
          context,
          PageNames.welcomePage,
        ),
      );
    } else {
      Future.delayed(
        Duration.zero,
        () async {
          currentUserModel = await createUserModel();
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, PageNames.homePage);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
