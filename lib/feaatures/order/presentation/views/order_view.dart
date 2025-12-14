import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  static const String id = 'OrderView';
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Order View"),
      ),
    );
  }
}
