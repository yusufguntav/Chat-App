import 'package:chat_app/models/userModel.dart';
import 'package:chat_app/services/getEmailByUsername.dart';
import 'package:chat_app/services/getUidByUsername.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<userModel> createUserModel() async {
  String id = FirebaseAuth.instance.currentUser!.uid;
  String userEmail = FirebaseAuth.instance.currentUser!.email.toString();
  String username = 'CurrentUser';

  userModel user = userModel(id, username, userEmail);
  return user;
}

Future<userModel> createOtherUserModel(String Username) async {
  String id = await getUidByUsername(Username);
  String username = Username;
  String userEmail = await getEmailByUsername(Username);

  userModel otherUser = userModel(id, username, userEmail);

  return otherUser;
}
