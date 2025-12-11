import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/widgets/build_app_bar.dart';
import 'package:fruit_hub/feaatures/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const id = "loginview";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(context, title: "تسجيل دخول"),
        body: LoginViewBody(),
      ),
    );
  }
}
