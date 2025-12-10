import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub/feaatures/on_boarding/data/models/on_boarding_model.dart';
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
  final PageController _controller = PageController();

  double currentPage = 0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!;
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
              height: h * 0.55,
              width: w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: currentPage == 0 ? true : false,
                    child: Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text("تخط"),
                      ),
                    ),
                  ),
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
                ],
              ),
            ),

            const SizedBox(height: 20),
            onList[index].title!,

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                onList[index].subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            const Spacer(),
            DotsIndicator(
              dotsCount: onList.length,
              position: currentPage,
              decorator: DotsDecorator(
                activeColor: AppColors.primary,
                color: Color(0xff5DB957).withOpacity(.5),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: currentPage == 1 ? true : false,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(),
              ),
            ),

            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
