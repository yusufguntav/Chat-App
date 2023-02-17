import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getUidByUsername(String username) async {
  try {
    final firebaseFirestore = FirebaseFirestore.instance;

    QuerySnapshot<Map<String, dynamic>> query = await firebaseFirestore
        .collection('users')
        .where('displayName', isEqualTo: username)
        .get();

    return query.docs[0].data()['uid'];
  } catch (e) {
    return e.toString();
  }
}
