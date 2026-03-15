import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/widgets/best_selling_app_bar.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/best_selling_body.dart';

class BestSellingView extends StatelessWidget {
  static const rootName = 'best_selling';
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bestSellingAppBar(),
      body: BestSellingBody(),
    );
  }
}
