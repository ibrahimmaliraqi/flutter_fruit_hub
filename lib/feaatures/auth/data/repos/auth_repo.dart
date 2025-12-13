import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, dynamic>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}
