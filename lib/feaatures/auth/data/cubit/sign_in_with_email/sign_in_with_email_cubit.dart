import 'package:bloc/bloc.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repos.dart';
import 'package:meta/meta.dart';

part 'sign_in_with_email_state.dart';

class SignInWithEmailCubit extends Cubit<SignInWithEmailState> {
  SignInWithEmailCubit(this.authRepos) : super(SignInWithEmailInitial());
  AuthRepos authRepos;
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(SignInWithEmailLoading());
    final result = await authRepos.signIn(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignInWithEmailFailure(failure.message)),
      (success) => emit(SignInWithEmailSuccess(success)),
    );
  }
}
