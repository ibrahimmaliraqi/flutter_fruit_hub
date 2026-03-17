import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/feaatures/home/data/model/product_model.dart';
import 'package:fruit_hub/feaatures/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getFeaturedProduct() async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('products')
          .where('isFeatured', isEqualTo: true)
          .get();

      List<ProductModel> products = result.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return right(products);
    } catch (e) {
      return left(AuthFailure.unknown(e.toString()));
    }
  }
}
