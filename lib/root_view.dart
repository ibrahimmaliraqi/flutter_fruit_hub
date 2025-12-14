import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/feaatures/category/presentation/views/category_view.dart';
import 'package:fruit_hub/feaatures/home/presentation/views/home_view.dart';
import 'package:fruit_hub/feaatures/order/presentation/views/order_view.dart';
import 'package:fruit_hub/feaatures/profile/presentation/views/profile_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});
  static const String id = 'RootView';

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  List<Widget> pages = [
    HomeView(),
    CategoryView(),
    OrderView(),
    ProfileView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.4,
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Color(0xff4E5556),
            selectedLabelStyle: AppStyles.bold13,
            unselectedLabelStyle: AppStyles.bold13,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'الاقسام',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.online_prediction_rounded),
                label: 'الطلبات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'الاعدادات',
              ),
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
