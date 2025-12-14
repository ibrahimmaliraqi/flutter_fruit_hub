import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hub/feaatures/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/feaatures/splash/presentation/views/splash_view.dart';
import 'package:fruit_hub/root_view.dart';

import '../../../feaatures/category/presentation/views/category_view.dart';
import '../../../feaatures/home/presentation/views/home_view.dart';
import '../../../feaatures/order/presentation/views/order_view.dart';
import '../../../feaatures/profile/presentation/views/profile_view.dart';

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
    case RootView.id:
      return MaterialPageRoute(
        builder: (context) => RootView(),
      );
    case OnBoardingView.id:
      return MaterialPageRoute(
        builder: (context) => OnBoardingView(),
      );
    case LoginView.id:
      return MaterialPageRoute(
        builder: (context) => LoginView(),
      );
    case HomeView.id:
      return MaterialPageRoute(
        builder: (context) => HomeView(),
      );
    case CategoryView.id:
      return MaterialPageRoute(
        builder: (context) => CategoryView(),
      );
    case OrderView.id:
      return MaterialPageRoute(
        builder: (context) => OrderView(),
      );
    case ProfileView.id:
      return MaterialPageRoute(
        builder: (context) => ProfileView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(),
      );
  }
}
