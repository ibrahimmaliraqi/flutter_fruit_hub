import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repos.dart';
import 'package:fruit_hub/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepos {
  @override
  Future<Either<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: password,
        password: password,
        data: {'name': name},
      );
      return Right(res.user);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e).message);
    }
  }
}
