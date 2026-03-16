import 'package:firebase_auth/firebase_auth.dart';

Future isLogin() async {
  return FirebaseAuth.instance.currentUser != null;
}
