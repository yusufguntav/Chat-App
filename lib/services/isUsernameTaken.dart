import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<bool> isUsernameTaken(String username) async {
  try {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection('users')
        .where('displayName', isEqualTo: username)
        .get();
    if (query.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  } on Exception catch (e) {
    debugPrint(
      e.toString(),
    );
    return true;
  }
}
