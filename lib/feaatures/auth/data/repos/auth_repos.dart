import 'package:dartz/dartz.dart';

abstract class AuthRepos {
  Future<Either<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
  });
}
