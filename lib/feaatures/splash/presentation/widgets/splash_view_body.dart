import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_prefs.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/feaatures/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excudeFunction();
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

  void excudeFunction() {
    bool inOnBording = SharedPrefs.getBool(isOnBoardingSeen);
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        if (inOnBording) {
          Navigator.pushReplacementNamed(context, LoginView.id);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.id);
        }
      },
    );
  }
}
