import 'package:chat_app/widgets/messageBubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetMessages extends StatelessWidget {
  const GetMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final _fireStore = FirebaseFirestore.instance;
    return StreamBuilder(
      stream: _fireStore.collection('messages').snapshots(),
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
          messageBubbles.add(
            MessageBubbles(
              user: message.data()['sender'],
              isMe: FirebaseAuth.instance.currentUser!.email ==
                  message.data()['sender'],
              message: message.data()['text'],
              time: message.data()['date'],
            ),
          );
        }
        // sort messages by date
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
