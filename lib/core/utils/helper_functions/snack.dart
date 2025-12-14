import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snack(
  BuildContext context, {
  required String text,
}) {
  return ScaffoldMessenger.of(
    context,
  ).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primary,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Text(
        text,
        style: AppStyles.bold13.copyWith(
          color: Colors.white,
        ),
      ),
    ),
  );
}
