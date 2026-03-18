import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_hub/feaatures/home/presentation/views/product_detil_view.dart';
import 'package:fruit_hub/feaatures/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/feaatures/splash/presentation/views/splash_view.dart';
import 'package:fruit_hub/root_view.dart';

import '../../../feaatures/category/presentation/views/category_view.dart';
import '../../../feaatures/home/presentation/views/best_selling_view.dart';
import '../../../feaatures/home/presentation/views/home_view.dart';
import '../../../feaatures/order/presentation/views/order_view.dart';
import '../../../feaatures/profile/presentation/views/profile_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashView.id: (context) => const SplashView(),
    ProductDetailsView.id: (context) => const ProductDetailsView(),
    SignUpView.id: (context) => const SignUpView(),
    BestSellingView.rootName: (context) => const BestSellingView(),
    RootView.id: (context) => const RootView(),
    OnBoardingView.id: (context) => const OnBoardingView(),
    LoginView.id: (context) => const LoginView(),
    HomeView.id: (context) => const HomeView(),
    CategoryView.id: (context) => const CategoryView(),
    OrderView.id: (context) => const OrderView(),
    ProfileView.id: (context) => const ProfileView(),
  };
}
