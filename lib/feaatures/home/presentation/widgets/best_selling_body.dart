import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/best_selling_grid_view.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: BestSellingGridView(),
    );
  }
}
