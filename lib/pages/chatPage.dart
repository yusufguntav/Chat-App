import 'package:chat_app/services/getMessages.dart';
import 'package:chat_app/services/sendMessages.dart';
import 'package:chat_app/services/signOut.dart';
import 'package:chat_app/widgets/textBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });
  @override
  State<ChatPage> createState() => _ChatPageState();
}

late User? _loggedInUser;
TextEditingController _textController = TextEditingController();

class _ChatPageState extends State<ChatPage> {
  late String text;
  @override
  void initState() {
    super.initState();
    _loggedInUser = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: (() async => await signOut(
                      context,
                    )),
                child: Text(
                  _loggedInUser!.email.toString(),
                ),
              ),
              const Expanded(
                child: GetMessages(),
              ),
              TextBox(
                controller: _textController,
                hintText: 'Type something...',
                suffixIcon: IconButton(
                  onPressed: () {
                    sendMessages(
                        _loggedInUser!.email.toString(), _textController.text);
                    _textController.text = '';
                  },
                  icon: const Icon(Icons.send),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
