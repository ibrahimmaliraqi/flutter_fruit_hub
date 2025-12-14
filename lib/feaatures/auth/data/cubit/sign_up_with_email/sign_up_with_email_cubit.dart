import 'package:bloc/bloc.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repos.dart';
import 'package:meta/meta.dart';

part 'sign_up_with_email_state.dart';

class SignUpWithEmailCubit extends Cubit<SignUpWithEmailState> {
  SignUpWithEmailCubit(this.authRepos) : super(SignUpWithEmailInitial());
  AuthRepos authRepos;
  Future<void> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpWithEmailLoading());
    final result = await authRepos.signUp(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignUpWithEmailFailure(failure)),
      (success) => emit(SignUpWithEmailSuccess(success)),
    );
  }
}
