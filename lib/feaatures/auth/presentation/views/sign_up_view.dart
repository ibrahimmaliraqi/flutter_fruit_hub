import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/widgets/build_app_bar.dart';
import 'package:fruit_hub/feaatures/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const id = "signupview";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(context, title: "حساب جديد"),
        body: SignUpViewBody(),
      ),
    );
  }
}
