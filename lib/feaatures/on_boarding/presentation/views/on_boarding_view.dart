import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub/feaatures/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/feaatures/on_boarding/data/models/on_boarding_model.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OnBoardingView extends StatefulWidget {
  static const id = "onboardingview";
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnBoardingViewBody()),
    );
  }
}

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController _controller;

  int currentPage = 0;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return PageView.builder(
      controller: _controller,
      itemCount: onList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: h * 0.5,
              width: w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      onList[index].backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: SvgPicture.asset(
                      onList[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Visibility(
                    visible: currentPage == 0 ? true : false,
                    child: Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: () => Navigator.of(
                            context,
                          ).pushReplacementNamed(LoginView.id),
                          child: Text("تخط"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(22),
            onList[index].title!,
            Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                onList[index].subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Color(0xff4E5556)),
              ),
            ),
            Gap(30),

            DotsIndicator(
              dotsCount: onList.length,
              position: currentPage.toDouble(),
              decorator: DotsDecorator(
                activeColor: AppColors.primary,
                color: Color(0xff5DB957).withOpacity(.5),
              ),
            ),
            Gap(20),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: currentPage > 0.8 ? true : false,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(LoginView.id),
                  text: "ابدأ الان",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
