import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/fruit_item.dart';

class FruitItemGridView extends StatelessWidget {
  const FruitItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 233,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}
