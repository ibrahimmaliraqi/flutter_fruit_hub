// file: failure.dart
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure(super.message);

  factory FirebaseAuthFailure.fromFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const FirebaseAuthFailure('البريد الإلكتروني غير صالح');
      case 'user-disabled':
        return const FirebaseAuthFailure('حساب المستخدم معطل');
      case 'user-not-found':
        return const FirebaseAuthFailure('المستخدم غير موجود');
      case 'wrong-password':
        return const FirebaseAuthFailure('كلمة المرور خاطئة');
      case 'email-already-in-use':
        return const FirebaseAuthFailure('البريد الإلكتروني مستخدم مسبقًا');
      case 'weak-password':
        return const FirebaseAuthFailure('كلمة المرور ضعيفة');
      case 'operation-not-allowed':
        return const FirebaseAuthFailure('العملية غير مسموحة حالياً');
      case 'too-many-requests':
        return const FirebaseAuthFailure(
          'عدد محاولات تسجيل الدخول أكثر من اللازم، حاول لاحقاً',
        );
      default:
        return const FirebaseAuthFailure('حدث خطأ غير معروف');
    }
  }
}
