part of 'sign_up_with_email_cubit.dart';

@immutable
sealed class SignUpWithEmailState {}

final class SignUpWithEmailInitial extends SignUpWithEmailState {}

final class SignUpWithEmailLoading extends SignUpWithEmailState {}

final class SignUpWithEmailSuccess extends SignUpWithEmailState {
  final UserModel data;
  SignUpWithEmailSuccess(this.data);
}

final class SignUpWithEmailFailure extends SignUpWithEmailState {
  final String failure;
  SignUpWithEmailFailure(this.failure);
}
