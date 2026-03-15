import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/feaatures/category/presentation/views/category_view.dart';
import 'package:fruit_hub/feaatures/home/presentation/views/home_view.dart';
import 'package:fruit_hub/feaatures/order/presentation/views/order_view.dart';
import 'package:fruit_hub/feaatures/profile/presentation/views/profile_view.dart';
import 'package:svg_flutter/svg.dart';

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
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 7,
              offset: Offset(0, -2),
              spreadRadius: 2,
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
                icon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxOutlineHome,
                  width: 24,
                  height: 24,
                  color: const Color(0xff4E5556),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxBoldHome,
                  width: 24,
                  height: 24,
                  color: AppColors.primary,
                ),
                label: "الرئيسية",
              ),

              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxOutlineProducts,
                  width: 24,
                  height: 24,
                  color: const Color(0xff4E5556),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxBoldProducts,
                  width: 24,
                  height: 24,
                  color: AppColors.primary,
                ),
                label: "الاقسام",
              ),

              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxOutlineShoppingCart,
                  width: 24,
                  height: 24,
                  color: const Color(0xff4E5556),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxBoldShoppingCart,
                  width: 24,
                  height: 24,
                  color: AppColors.primary,
                ),
                label: "الطلبات",
              ),

              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxOutlineUser,
                  width: 24,
                  height: 24,
                  color: const Color(0xff4E5556),
                ),
                activeIcon: SvgPicture.asset(
                  Assets.assetsImagesVuesaxBoldUser,
                  width: 24,
                  height: 24,
                  color: AppColors.primary,
                ),
                label: "الاعدادات",
              ),
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
