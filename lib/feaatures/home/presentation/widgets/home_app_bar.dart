import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: AppStyles.regular16.copyWith(
          color: Color(0xFF949D9E),
        ),
      ),

      subtitle: Text(
        'أحمد مصطفي',
        textAlign: TextAlign.right,
        style: AppStyles.bold16.copyWith(
          color: Colors.black,
        ),
      ),

      leading: Image.asset(
        Assets.assetsImagesProfileImage,
      ),
      trailing: Container(
        padding: EdgeInsets.all(12),
        child: SvgPicture.asset(
          Assets.assetsImagesNotification,
        ),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEF8ED) /* green-50 */,
          shape: OvalBorder(),
        ),
      ),
    );
  }
}
