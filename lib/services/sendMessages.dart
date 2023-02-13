import 'package:cloud_firestore/cloud_firestore.dart';

sendMessages(String sender, String text) async {
  if (text.isNotEmpty && text.trim() != '') {
    final _firebaseFirestore = FirebaseFirestore.instance;
    await _firebaseFirestore.collection('messages').add(
      {
        'sender': sender,
        'text': text,
        'date': DateTime.now(),
        // 'sentTo': sentTo,
      },
    );
  }
}
