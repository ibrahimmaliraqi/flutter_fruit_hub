import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/feaatures/auth/data/models/user_model.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repos.dart';

class AuthRepoImpl extends AuthRepos {
  @override
  Future<Either<Failure, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(
        UserModel(
          uId: credential.user!.uid,
          name: credential.user!.displayName ?? '',
          email: credential.user!.email!,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.fromFirebaseException(e));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return right(
        UserModel(
          uId: credential.user!.uid,
          name: name,
          email: email,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.fromFirebaseException(e));
    } catch (e) {
      return Left(FirebaseAuthFailure('حدث خطأ غير معروف'));
    }
  }
}
