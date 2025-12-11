import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hub/feaatures/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/feaatures/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.id:
      return MaterialPageRoute(
        builder: (context) => SplashView(),
      );
    case SignUpView.id:
      return MaterialPageRoute(
        builder: (context) => SignUpView(),
      );
    case OnBoardingView.id:
      return MaterialPageRoute(
        builder: (context) => OnBoardingView(),
      );
    case LoginView.id:
      return MaterialPageRoute(
        builder: (context) => LoginView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(),
      );
  }
}
