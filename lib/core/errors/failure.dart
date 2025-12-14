import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class SupabaseFailure extends Failure {
  const SupabaseFailure(super.message);

  factory SupabaseFailure.fromException(Object error) {
    if (error is AuthException) {
      return SupabaseFailure(_mapAuthError(error.message));
    }

    if (error is PostgrestException) {
      return SupabaseFailure(_mapPostgrestError(error.code));
    }

    if (error.toString().contains('SocketException')) {
      return const SupabaseFailure('لا يوجد اتصال بالإنترنت');
    }

    return const SupabaseFailure('حدث خطأ غير متوقع');
  }

  static String _mapAuthError(String message) {
    if (message.contains('Invalid login credentials')) {
      return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';
    }
    if (message.contains('User already registered')) {
      return 'هذا البريد مستخدم مسبقًا';
    }
    if (message.contains('Password should be at least')) {
      return 'كلمة المرور ضعيفة';
    }
    if (message.contains('Email not confirmed')) {
      return 'يرجى تأكيد البريد الإلكتروني';
    }

    return 'خطأ في المصادقة';
  }

  static String _mapPostgrestError(String? code) {
    switch (code) {
      case '23505':
        return 'البيانات موجودة مسبقًا';
      case '42501':
        return 'ليس لديك صلاحية';
      case 'PGRST116':
        return 'لا توجد بيانات';
      default:
        return 'خطأ في قاعدة البيانات';
    }
  }
}
