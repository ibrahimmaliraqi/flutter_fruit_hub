import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  final String? code;

  const Failure({
    required this.message,
    this.code,
  });

  @override
  String toString() => 'AppFailure(message: $message, code: $code)';
}

class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code,
  });

  factory AuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const AuthFailure(
          message: 'The email address is not valid.',
          code: 'invalid-email',
        );

      case 'user-disabled':
        return const AuthFailure(
          message: 'This user account has been disabled.',
          code: 'user-disabled',
        );

      case 'user-not-found':
        return const AuthFailure(
          message: 'No user found for this email.',
          code: 'user-not-found',
        );

      case 'wrong-password':
      case 'invalid-credential':
        return const AuthFailure(
          message: 'Email or password is incorrect.',
          code: 'invalid-credential',
        );

      case 'email-already-in-use':
        return const AuthFailure(
          message: 'This email is already in use.',
          code: 'email-already-in-use',
        );

      case 'weak-password':
        return const AuthFailure(
          message: 'The password is too weak.',
          code: 'weak-password',
        );

      case 'operation-not-allowed':
        return const AuthFailure(
          message: 'This authentication method is not enabled.',
          code: 'operation-not-allowed',
        );

      case 'too-many-requests':
        return const AuthFailure(
          message: 'Too many requests. Please try again later.',
          code: 'too-many-requests',
        );

      case 'network-request-failed':
        return const AuthFailure(
          message: 'Please check your internet connection.',
          code: 'network-request-failed',
        );

      default:
        return AuthFailure(
          message: e.message ?? 'Authentication failed. Please try again.',
          code: e.code,
        );
    }
  }

  factory AuthFailure.unknown([String? message]) {
    return AuthFailure(
      message: message ?? 'Something went wrong. Please try again.',
      code: 'unknown',
    );
  }
}
