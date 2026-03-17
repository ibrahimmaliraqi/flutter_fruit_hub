import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/feaatures/home/data/manager/get_product/get_products_cubit.dart';
import 'package:fruit_hub/feaatures/home/data/model/product_model.dart';
import 'package:fruit_hub/feaatures/home/presentation/widgets/fruit_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductsCubit, GetProductsState>(
      listener: (context, state) {
        if (state is GetProductsFailure) {
          debugPrint(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,
                child: FruitItem(
                  productModel: ProductModel(
                    code: "code",
                    description: "description",
                    expirationsMonths: 2,
                    imageUrl: "imageUrl",
                    isFeatured: true,
                    isOrganic: true,
                    name: "اسم منتج طويل لتجربة السكيليتون",
                    numberOfCalories: 44,
                    price: 43,
                    reviews: [],
                    sellingCount: 212,
                    unitAmount: 12,
                  ),
                ),
              );
            },
          );
        }

        if (state is GetProductsSuccess) {
          if (state.product.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text("ماكو بيانات"),
              ),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.product.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return FruitItem(
                productModel: state.product[index],
              );
            },
          );
        }

        if (state is GetProductsFailure) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(state.errMessage),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
