import 'package:appointment_app/feature/auth/login/data/models/login_request_body.dart';
import 'package:appointment_app/feature/auth/login/data/repository/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment_app/feature/auth/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResopnse) => emit(LoginState.success(loginResopnse)),
      failure: (error) => emit(
        LoginState.error(error: error.apiErrorModel.message ?? "")
      ),
    );
  }
}
