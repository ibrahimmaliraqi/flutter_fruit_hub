import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetWorkImage extends StatelessWidget {
  const NetWorkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://hchbtxlqvtmswhthhsev.supabase.co/storage/v1/object/public/$imageUrl",
      fit: BoxFit.contain,
      errorWidget: (context, url, error) {
        return Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Icon(Icons.broken_image, size: 40),
        );
      },
    );
  }
}
