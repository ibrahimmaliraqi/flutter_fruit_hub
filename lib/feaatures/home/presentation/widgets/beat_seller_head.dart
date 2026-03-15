import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class BeatSellerHead extends StatelessWidget {
  const BeatSellerHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: AppStyles.bold16.copyWith(
            color: Colors.black,
          ),
        ),
        Spacer(),
        Text(
          'المزيد',
          textAlign: TextAlign.center,
          style: AppStyles.reqular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
      ],
    );
  }
}
