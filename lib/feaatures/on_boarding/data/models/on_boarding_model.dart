import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/utils/assets.dart';

class OnBoardingModel {
  final String backgroundImage;
  final String image;
  final Widget? title;
  final String subTitle;

  OnBoardingModel({
    required this.backgroundImage,
    required this.image,
    this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onList = [
  OnBoardingModel(
    title: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'مرحبًا بك في',
            style: TextStyle(
              color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' Fruit',
            style: TextStyle(
              color: const Color(0xFF1B5E37) /* Green1-500 */,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: 'HUB',
            style: TextStyle(
              color: const Color(0xFFF4A91F) /* Orange-500 */,
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
    backgroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
    image: Assets.assetsImagesPageViewItem1Image,
    subTitle:
        "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
  ),
  OnBoardingModel(
    title: SizedBox(
      width: 301,
      child: Text(
        'ابحث وتسوق',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF0C0D0D) /* Grayscale-950 */,
          fontSize: 23,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    backgroundImage: Assets.assetsImagesPageViewItem2BackgroundImage,
    image: Assets.assetsImagesPageViewItem2Image,
    subTitle:
        "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
  ),
];
