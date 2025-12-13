import 'package:bloc/bloc.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_with_email_state.dart';

class SignupWithEmailCubit extends Cubit<SignupWithEmailState> {
  SignupWithEmailCubit(this.authRepo) : super(SignupWithEmailInitial());
  AuthRepo authRepo;
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignupWithEmailLoading());
    final result = await authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignupWithEmailFailure(failure.message)),
      (successMessage) => emit(SignupWithEmailSuccess(successMessage)),
    );
  }
}
