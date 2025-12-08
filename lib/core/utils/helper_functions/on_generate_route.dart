import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/feaatures/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.id:
      return MaterialPageRoute(
        builder: (context) => SplashView(),
      );
    case OnBoardingView.id:
      return MaterialPageRoute(
        builder: (context) => OnBoardingView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(),
      );
  }
}
