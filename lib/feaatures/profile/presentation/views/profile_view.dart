import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static const String id = 'ProfileView';
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile View"),
      ),
    );
  }
}
