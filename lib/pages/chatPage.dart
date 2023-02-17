import 'package:chat_app/assets/constants.dart';
import 'package:chat_app/pages/staticPageNames.dart';
import 'package:chat_app/services/getMessages.dart';
import 'package:chat_app/services/sendMessages.dart';
import 'package:chat_app/widgets/textBox.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

TextEditingController _textController = TextEditingController();

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popAndPushNamed(context, PageNames.homePage),
        backgroundColor: kButtonBackgroundColor,
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: GetMessages(),
              ),
              TextBox(
                controller: _textController,
                hintText: 'Type something...',
                suffixIcon: IconButton(
                  onPressed: () {
                    sendMessages(
                      _textController.text,
                    );
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
