import 'package:appointment_app/feature/auth/signup/data/model/signup_request_body.dart';
import 'package:appointment_app/feature/auth/signup/data/repository/signup_repo.dart';
import 'package:appointment_app/feature/auth/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  void signup(SignupRequestBody user) async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(user);
    response.when(
        success: (signUpResponse) =>
            emit(SignupState.signupSuccess(signUpResponse)),
        failure: (error) => emit(
            SignupState.signupError(error: error.apiErrorModel.message ?? "")));
  }


  void validateThenSignup(SignupRequestBody user) {
    if (formKey.currentState!.validate()) {
      signup(user);
    }
  }

  void changePasswordVisibility() {
    emit(SignupState.passwordVisability(
      isObscureText: state.maybeWhen(
        passwordVisability: (isObscureText) => !isObscureText,
        orElse: () => false,
      ),
    ));
  }
}
