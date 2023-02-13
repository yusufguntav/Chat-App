import 'package:chat_app/assets/constants.dart';
import 'package:chat_app/pages/chatPage.dart';
import 'package:chat_app/pages/homePage.dart';
import 'package:chat_app/pages/loadingPage.dart';
import 'package:chat_app/pages/loginPage.dart';
import 'package:chat_app/pages/registerPage.dart';
import 'package:chat_app/pages/staticPageNames.dart';
import 'package:chat_app/pages/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: kThemeData,
      initialRoute: PageNames.loadingPage,
      routes: {
        PageNames.welcomePage: (context) => const WelcomePage(),
        PageNames.loginPage: (context) => const LoginPage(),
        PageNames.registerPage: (context) => const RegisterPage(),
        PageNames.chatPage: (context) => const ChatPage(),
        PageNames.loadingPage: (context) => const LoadingPage(),
        PageNames.homePage: (context) => const HomePage(),
      },
    );
  }
}
