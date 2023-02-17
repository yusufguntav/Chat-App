import 'package:chat_app/pages/loadingPage.dart';
import 'package:chat_app/widgets/messageBubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetMessages extends StatelessWidget {
  const GetMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fireStore = FirebaseFirestore.instance;
    return StreamBuilder(
      stream: fireStore
          .collection('messages')
          .doc(currentUserModel.id)
          .collection('userMessages')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }

        List<MessageBubbles> messageBubbles = [];

        final messages = snapshot.data!.docs;
        for (var message in messages) {
          if (message.data()['sentTo'] == otherUserModel.id ||
              message.data()['sentBy'] == otherUserModel.id) {
            messageBubbles.add(
              MessageBubbles(
                user: (message.data()['sentBy'] != currentUserModel.id)
                    ? otherUserModel.username
                    : '',
                isMe: currentUserModel.id == message.data()['sentBy'],
                message: message.data()['text'],
                time: message.data()['date'],
              ),
            );
          }
        }
        // sort messages depend date
        messageBubbles.sort(
          (a, b) => a.time.compareTo(b.time),
        );

        messageBubbles = List.from(messageBubbles.reversed);
        return ListView(
          reverse: true,
          children: messageBubbles,
        );
      },
    );
  }
}
