import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/helper_functions/snack.dart';
import 'package:fruit_hub/feaatures/home/data/manager/get_featured_product/get_featured_product_cubit.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/featured_item.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/product_fail_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFeaturedProductCubit, GetFeaturedProductState>(
      listener: (context, state) {
        if (state is GetFeaturedProductFailure) {
          snack(context, text: state.errMessage);
          debugPrint(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is GetFeaturedProductSuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                state.product.length,
                (index) {
                  final data = state.product[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: FeaturedItem(
                      imageUrl: data.imageUrl,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is GetFeaturedProductLoading) {
          return Skeletonizer(
            enabled: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: FeaturedItem(
                        imageUrl: "",
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                4,
                (index) => const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: FruitItemFailure(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
