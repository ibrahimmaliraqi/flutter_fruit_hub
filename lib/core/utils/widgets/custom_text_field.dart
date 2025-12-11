import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final String text;
  final bool isPassword;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.text,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSecure = true;
  pass() {
    setState(() {
      isSecure = widget.isPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    isSecure = widget.isPassword; // إذا كان حقل كلمة مرور → فعّل الإخفاء
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? isSecure : false,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "الحقل مطلوب";
        }
        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                child: Icon(
                  isSecure ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff949D9E),
                ),
              )
            : null,
        labelText: widget.text,
        labelStyle: AppStyles.bold13,

        filled: true,
        fillColor: Color(0xffF9FAFA),

        enabledBorder: buildBoeder(),
        focusedBorder: buildBoeder(),
        border: buildBoeder(),
      ),
    );
  }

  OutlineInputBorder buildBoeder() => OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE6E9EA)),
    borderRadius: BorderRadius.circular(4),
  );
}
