import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';

abstract class AuthRepos {
  Future<Either<Failure, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, dynamic>> signIn({
    required String email,
    required String password,
  });
}
