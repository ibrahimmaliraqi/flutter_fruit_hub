part of 'signup_with_email_cubit.dart';

@immutable
sealed class SignupWithEmailState {}

final class SignupWithEmailInitial extends SignupWithEmailState {}

final class SignupWithEmailLoading extends SignupWithEmailState {}

final class SignupWithEmailSuccess extends SignupWithEmailState {}

final class SignupWithEmailFailure extends SignupWithEmailState {
  final String errorMessage;

  SignupWithEmailFailure(this.errorMessage);
}
