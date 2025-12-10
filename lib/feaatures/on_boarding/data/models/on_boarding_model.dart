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
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("مرحبًا بك في "),
        Text("Fruit"),
        Text("HUB"),
      ],
    ),
    backgroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
    image: Assets.assetsImagesPageViewItem1Image,
    subTitle:
        "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
  ),
  OnBoardingModel(
    title: Text("ابحث وتسوق"),
    backgroundImage: Assets.assetsImagesPageViewItem2BackgroundImage,
    image: Assets.assetsImagesPageViewItem2Image,
    subTitle:
        "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
  ),
];
