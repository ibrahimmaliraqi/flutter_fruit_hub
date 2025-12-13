import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, dynamic>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right("تم انشاء الحساب بنجاح.");
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure.fromException(e));
    } catch (e) {
      return Left(Failure("حدث خطأ غير معروف."));
    }
  }
}
