import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class FruitItemFailure extends StatelessWidget {
  const FruitItemFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF3F5F7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 40,
            color: Colors.red,
          ),
          const SizedBox(height: 10),
          Text(
            'فشل تحميل المنتج',
            style: AppStyles.reqular13.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'حاول مرة أخرى',
            style: AppStyles.reqular13.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
