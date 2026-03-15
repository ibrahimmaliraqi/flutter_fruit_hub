import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/featured_item.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: FeaturedItem(),
            );
          },
        ),
      ),
    );
  }
}
