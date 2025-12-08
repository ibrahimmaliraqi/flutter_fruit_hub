import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/assets.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetsImagesSplashHeader),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesSplashMain),
        SvgPicture.asset(Assets.assetsImagesSplashBottom),
      ],
    );
  }

  void excudeFunction() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacementNamed(context, OnBoardingView.id);
      },
    );
  }
}
