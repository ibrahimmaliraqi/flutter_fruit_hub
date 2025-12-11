import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/widgets/custom_text_field.dart';
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
          ],
        ),
      ),
    );
  }
}
