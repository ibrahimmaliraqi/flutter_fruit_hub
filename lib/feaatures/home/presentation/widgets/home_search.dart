import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsImagesFilter,
              ),
            ),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsImagesSearchIcon,
              ),
            ),
          ),
          labelText: "ابحث عن.......",
          labelStyle: AppStyles.reqular13.copyWith(
            color: const Color(0xFF949D9E),
          ),

          filled: true,
          fillColor: Colors.white,

          enabledBorder: buildBoeder(),
          focusedBorder: buildBoeder(),
          border: buildBoeder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBoeder() => OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(4),
  );
}
