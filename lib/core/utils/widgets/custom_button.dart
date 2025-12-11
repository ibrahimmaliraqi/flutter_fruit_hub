import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.bold16,
        ),
      ),
    );
  }
}
