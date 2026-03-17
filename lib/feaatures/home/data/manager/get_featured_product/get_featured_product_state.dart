part of 'get_featured_product_cubit.dart';

@immutable
sealed class GetFeaturedProductState {}

final class GetFeaturedProductInitial extends GetFeaturedProductState {}

final class GetFeaturedProductLoading extends GetFeaturedProductState {}

final class GetFeaturedProductSuccess extends GetFeaturedProductState {
  final List<ProductModel> product;

  GetFeaturedProductSuccess(this.product);
}

final class GetFeaturedProductFailure extends GetFeaturedProductState {
  final String errMessage;

  GetFeaturedProductFailure(this.errMessage);
}
