import 'package:chat_app/widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../assets/constants.dart';

class MessageBubbles extends StatelessWidget {
  MessageBubbles({
    super.key,
    required this.user,
    required this.message,
    required this.time,
    required this.isMe,
  });
  bool isMe;
  Timestamp time;
  String user;
  String message;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          (isMe) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment:
                (isMe) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              // user info
              (!isMe)
                  ? Header(
                      text: user,
                      headerSize: HeaderSize.headerSmall,
                    )
                  : const SizedBox(),
              // text
              DecoratedBox(
                decoration: BoxDecoration(
                  color: (isMe) ? kMyMessageColor : kOthersMessageColor,
                  borderRadius: (isMe)
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(
                            40,
                          ),
                          bottomLeft: Radius.circular(
                            40,
                          ),
                          bottomRight: Radius.circular(
                            30,
                          ),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(
                            40,
                          ),
                          bottomRight: Radius.circular(
                            40,
                          ),
                          bottomLeft: Radius.circular(
                            30,
                          ),
                        ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
