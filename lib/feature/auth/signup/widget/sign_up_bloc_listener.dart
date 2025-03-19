import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/routing/route.dart';
import 'package:appointment_app/core/widget/error_dialog.dart';
import 'package:appointment_app/core/widget/loading_dialog.dart';
import 'package:appointment_app/feature/auth/login/logic/cubit/login_state.dart';
import 'package:appointment_app/feature/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:appointment_app/feature/auth/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () => showDialog(
              context: context, builder: (context) => const LoadingDialog()),
          signupSuccess: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.home);
          },
          signupError: (error) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) => ErrorDialog(message: error));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
