import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: SvgPicture.asset(
        Assets.assetsImagesNotification,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED) /* green-50 */,
        shape: OvalBorder(),
      ),
    );
  }
}
