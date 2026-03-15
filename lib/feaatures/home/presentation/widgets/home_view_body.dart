import 'package:flutter/material.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/featured_item.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/home_app_bar.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/home_search.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeAppBar(),
                Gap(16),
                HomeSearch(),
                Gap(12),
                FeaturedItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
