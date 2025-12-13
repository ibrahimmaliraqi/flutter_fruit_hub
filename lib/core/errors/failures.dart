// failure.dart
import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String message;
  Failure(this.message);
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.message);

  /// Factory واحدة لتحليل كود الخطأ وإرجاع الرسالة المناسبة
  factory FirebaseAuthFailure.fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return FirebaseAuthFailure("المستخدم غير موجود.");
      case 'wrong-password':
        return FirebaseAuthFailure("كلمة المرور غير صحيحة.");
      case 'email-already-in-use':
        return FirebaseAuthFailure("البريد الإلكتروني مستخدم مسبقًا.");
      case 'weak-password':
        return FirebaseAuthFailure("كلمة المرور ضعيفة جدًا.");
      case 'invalid-email':
        return FirebaseAuthFailure("البريد الإلكتروني غير صالح.");
      case 'too-many-requests':
        return FirebaseAuthFailure("تم حظر الطلبات مؤقتًا. حاول لاحقًا.");
      case 'operation-not-allowed':
        return FirebaseAuthFailure("هذه العملية غير مسموح بها.");
      default:
        return FirebaseAuthFailure("حدث خطأ غير معروف.");
    }
  }

  /// Factory لتحليل استثناء FirebaseAuthException مباشرة
  factory FirebaseAuthFailure.fromException(FirebaseAuthException e) {
    return FirebaseAuthFailure.fromCode(e.code);
  }
}
