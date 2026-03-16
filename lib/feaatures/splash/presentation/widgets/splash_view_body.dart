import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_prefs.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/helper_functions/is_login.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/feaatures/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub/root_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(Assets.assetsImagesSplashBottom),
      ],
    );
  }

  void excuteNaviagtion() {
    bool isOnBoardingViewSeen = SharedPrefs.getBool(isOnBoardingSeen) ?? false;

    Future.delayed(const Duration(seconds: 3), () async {
      if (isOnBoardingViewSeen) {
        bool isLoggedIn = await isLogin();

        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, RootView.id);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.id);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.id);
      }
    });
  }
}
