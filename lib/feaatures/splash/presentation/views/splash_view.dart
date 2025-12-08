import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String id = "splashView";
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(),
    );
  }
}
