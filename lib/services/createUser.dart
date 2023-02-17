import 'package:cloud_firestore/cloud_firestore.dart';

createUser(String userEmail, String userID, String displayName) async {
  final firebaseFirestore = FirebaseFirestore.instance;
  await firebaseFirestore.collection('users').add(
    {
      'userMail': userEmail,
      'uid': userID,
      'displayName': displayName,
    },
  );
}
