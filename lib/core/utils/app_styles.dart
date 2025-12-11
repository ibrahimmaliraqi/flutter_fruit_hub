import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

abstract class AppStyles {
  static TextStyle bold19 = TextStyle(
    color: AppColors.textColor,
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold13 = TextStyle(
    color: Color(0xff949D9E),
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle semiBold13 = TextStyle(
    color: Color(0xff2D9F5D),
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold16 = TextStyle(
    color: Color(0xff949D9E),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
