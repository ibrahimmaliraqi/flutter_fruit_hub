import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/feaatures/home/data/model/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getFeaturedProduct();
}
