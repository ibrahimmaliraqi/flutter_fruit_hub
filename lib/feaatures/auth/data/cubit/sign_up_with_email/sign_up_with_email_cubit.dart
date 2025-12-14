import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_with_email_state.dart';

class SignUpWithEmailCubit extends Cubit<SignUpWithEmailState> {
  SignUpWithEmailCubit() : super(SignUpWithEmailInitial());
}
