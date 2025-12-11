import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/widgets/custom_text_field.dart';
import 'package:fruit_hub/feaatures/auth/presentation/widgets/custom_social_auth_button.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            Gap(10),
            CustomTextField(
              text: "البريد الإلكتروني",
              controller: email,
            ),
            Gap(16),
            CustomTextField(
              isPassword: true,
              text: "كلمة المرور",
              controller: password,
            ),
            Gap(16),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: GestureDetector(
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: AppStyles.semiBold13,
                ),
              ),
            ),
            Gap(33),
            CustomButton(text: "تسجيل دخول"),
            Gap(33),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "لا تمتلك حساب؟ ",
                  style: AppStyles.semiBold16,
                ),
                Text(
                  "قم بإنشاء حساب",
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Gap(33),
            Row(
              children: [
                Expanded(child: Divider()),
                Gap(18),
                Text(
                  "أو",
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
                Gap(18),

                Expanded(child: Divider()),
              ],
            ),
            Gap(16),
            CustomSocialAuthButton(
              text: "تسجيل بواسطة جوجل",
              icon: Assets.assetsImagesGoogleIcon,
            ),
            Gap(16),
            CustomSocialAuthButton(
              text: "تسجيل بواسطة أبل",
              icon: Assets.assetsImagesApplIcon,
            ),
            Gap(16),
            CustomSocialAuthButton(
              text: "تسجيل بواسطة فيسبوك",
              icon: Assets.assetsImagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
