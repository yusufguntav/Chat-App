import 'package:chat_app/pages/loadingPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

sendMessages(String text) async {
  if (text.isNotEmpty && text.trim() != '') {
    await _sendMessage(
      otherUserModel.id,
      text,
      currentUserModel.id,
      currentUserModel.id,
      otherUserModel.id,
    );
    await _sendMessage(
      currentUserModel.id,
      text,
      otherUserModel.id,
      currentUserModel.id,
      otherUserModel.id,
    );
  }
}

_sendMessage(String otherUserID, String text, String currentUserID,
    String sentBy, String sentTo) async {
  final firebaseFirestore = FirebaseFirestore.instance;
  firebaseFirestore.collection('messages').doc(currentUserID);

  await firebaseFirestore
      .collection('messages')
      .doc(currentUserID)
      .collection('userMessages')
      .add(
    {
      'sentBy': sentBy,
      'sentTo': sentTo,
      'text': text,
      'date': DateTime.now(),
    },
  );
}
