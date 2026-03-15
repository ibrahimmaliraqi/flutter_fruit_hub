import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:gap/gap.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(
              Icons.favorite_outline_rounded,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Gap(17),
              SizedBox(
                width: 114,
                height: 105,
                child: Image.asset(
                  Assets.assetsImagesWatermelonTest,
                ),
              ),
              Gap(20),
              ListTile(
                title: Text(
                  'فراولة',
                  textAlign: TextAlign.right,
                  style: AppStyles.reqular13.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '20جنية ',
                        style: TextStyle(
                          color: const Color(0xFFF4A91F) /* Orange-500 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyle(
                          color: const Color(0xFFF8C76D) /* Orange-300 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: const Color(0xFFF4A91F) /* Orange-500 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          height: 1.70,
                        ),
                      ),
                      TextSpan(
                        text: 'الكيلو',
                        style: TextStyle(
                          color: const Color(0xFFF8C76D) /* Orange-300 */,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          height: 1.70,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
