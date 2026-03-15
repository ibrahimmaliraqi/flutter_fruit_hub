import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeAppBar(),
        ),
      ],
    );
  }
}
