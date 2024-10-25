import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/user_repository.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.userRepository) : super(SigninInitial());

  final UserRepository userRepository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emaileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  signIn() async {
    emit(SigninLoading());
    final response = await userRepository.signIn(
        emaile: emaileController.text, password: passwordController.text);
    response.fold(
        (errorMessage) => emit(SigninFailure(errorMessage: errorMessage)),
        (signInModel) => emit(SigninSuccess()));
  }

  reset() {
    emaileController.clear();
    passwordController.clear();
    formKey.currentState?.reset();
  }
}
