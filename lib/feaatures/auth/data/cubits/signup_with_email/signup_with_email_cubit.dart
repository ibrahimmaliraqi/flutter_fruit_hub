import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_with_email_state.dart';

class SignupWithEmailCubit extends Cubit<SignupWithEmailState> {
  SignupWithEmailCubit() : super(SignupWithEmailInitial());
}
