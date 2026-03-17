import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, this.onTap, required this.imageUrl});
  final VoidCallback? onTap;
  final String imageUrl;

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
              child: CachedNetworkImage(
                imageUrl:
                    "https://hchbtxlqvtmswhthhsev.supabase.co/storage/v1/object/public/$imageUrl",
                fit: BoxFit.contain,
                errorWidget: (context, url, error) {
                  return Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: Icon(Icons.broken_image, size: 40),
                  );
                },
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
