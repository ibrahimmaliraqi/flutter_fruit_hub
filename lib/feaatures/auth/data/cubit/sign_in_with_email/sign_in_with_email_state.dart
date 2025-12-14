part of 'sign_in_with_email_cubit.dart';

@immutable
sealed class SignInWithEmailState {}

final class SignInWithEmailInitial extends SignInWithEmailState {}

final class SignInWithEmailLoading extends SignInWithEmailState {}

final class SignInWithEmailSuccess extends SignInWithEmailState {
  final dynamic sucess;
  SignInWithEmailSuccess(this.sucess);
}

final class SignInWithEmailFailure extends SignInWithEmailState {
  final String errMessage;
  SignInWithEmailFailure(this.errMessage);
}
