import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  static const String id = 'CategoryView';
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Category View"),
      ),
    );
  }
}
