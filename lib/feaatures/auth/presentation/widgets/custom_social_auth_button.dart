import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class CustomSocialAuthButton extends StatelessWidget {
  final String text;
  final String icon;
  final void Function()? onTap;
  const CustomSocialAuthButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 19),
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xffDDDFDF)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            Gap(53),
            Text(
              text,
              style: AppStyles.semiBold16.copyWith(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
