import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String id = 'HomeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
