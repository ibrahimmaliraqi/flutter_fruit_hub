import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/feaatures/auth/data/models/user_model.dart';

abstract class AuthRepos {
  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  });
}
