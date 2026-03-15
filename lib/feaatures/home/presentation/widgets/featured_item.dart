import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/assets.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,
      height: 158,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesWatermelonTest,
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.15),
              ),
            ),

            Positioned(
              top: -298,
              child: Container(
                width: itemWidth * .5,
                height: 753,
                decoration: const ShapeDecoration(
                  color: Color(0xFF5DB957),
                  shape: OvalBorder(),
                ),
              ),
            ),

            Positioned(
              right: 20,
              top: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Opacity(
                    opacity: 0.8,
                    child: Text(
                      'عروض العيد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'خصم 25%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 20,
              bottom: 20,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: 116,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'تسوق الان',
                    style: TextStyle(
                      color: Color(0xFF1B5E37),
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
