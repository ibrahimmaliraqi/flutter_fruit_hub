import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/helper_functions/snack.dart';
import 'package:fruit_hub/core/utils/widgets/custom_button.dart';
import 'package:fruit_hub/core/utils/widgets/custom_text_field.dart';
import 'package:fruit_hub/feaatures/auth/data/cubit/sign_up_with_email/sign_up_with_email_cubit.dart';
import 'package:gap/gap.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool check = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Gap(10),
              CustomTextField(
                text: "الاسم كامل",
                controller: name,
              ),
              Gap(16),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffDDDFDF)),
                      borderRadius: BorderRadiusGeometry.circular(4),
                    ),
                    value: check,
                    onChanged: (value) {
                      setState(() {
                        check = !check;
                      });
                    },
                  ),
                  Gap(8),
                  Flexible(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily:
                              "Cairo", // ← الحل الوحيد الذي يجعل TextSpan يأخذ الخط
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: "من خلال إنشاء حساب ، فإنك توافق على ",
                          ),
                          TextSpan(
                            text: "الشروط والأحكام الخاصة بنا",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              color: Color(0xff2D9F5D),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(33),
              BlocConsumer<SignUpWithEmailCubit, SignUpWithEmailState>(
                listener: (context, state) {
                  if (state is SignUpWithEmailSuccess) {
                    snack(context, text: "تم انشاء الحساب بنجاح");
                    Navigator.of(context).pop();
                  } else if (state is SignUpWithEmailFailure) {
                    snack(context, text: state.failure);
                  }
                },
                builder: (context, state) {
                  return state is SignUpWithEmailLoading
                      ? Center(
                          child: CupertinoActivityIndicator(
                            color: AppColors.primary,
                            radius: 19,
                          ),
                        )
                      : CustomButton(
                          text: "إنشاء حساب جديد",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignUpWithEmailCubit>(
                                context,
                              ).signUpWithEmail(
                                name: name.text.trim(),
                                email: email.text.trim(),
                                password: password.text.trim(),
                              );
                            }
                          },
                        );
                },
              ),
              Gap(33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تمتلك حساب بالفعل؟ ",
                    style: AppStyles.semiBold16,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      "تسجيل دخول",
                      style: AppStyles.semiBold16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
