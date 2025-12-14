import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repos.dart';
import 'package:fruit_hub/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl extends AuthRepos {
  @override
  Future<Either<Failure, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      return Right(res.user!.id);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return right(res.user!.id);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }
}
