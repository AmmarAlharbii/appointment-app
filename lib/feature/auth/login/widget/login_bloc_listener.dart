import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/routing/route.dart';
import 'package:appointment_app/core/theme/colors.dart';
import 'package:appointment_app/core/widget/error_dialog.dart';
import 'package:appointment_app/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:appointment_app/feature/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorManager.bluePrimary,
              ),
            ),
          ),
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.home);
          },
          error: (error) {
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
