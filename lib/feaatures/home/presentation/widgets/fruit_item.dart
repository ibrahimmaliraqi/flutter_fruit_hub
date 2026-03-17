import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/feaatures/home/data/model/product_model.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/network_image.dart';
import 'package:gap/gap.dart';

class FruitItem extends StatelessWidget {
  final ProductModel productModel;
  const FruitItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Gap(17),
              SizedBox(
                width: 114,
                height: 105,
                child: NetWorkImage(imageUrl: productModel.imageUrl),
              ),
              Gap(20),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    productModel.name,
                    textAlign: TextAlign.right,
                    style: AppStyles.reqular13.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),

                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${productModel.price} ألف',
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
