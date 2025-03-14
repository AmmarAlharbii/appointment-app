import 'package:appointment_app/core/helpers/spacing.dart';
import 'package:appointment_app/core/theme/style.dart';
import 'package:appointment_app/core/widget/app_text_button.dart';
import 'package:appointment_app/feature/auth/login/data/models/login_request_body.dart';
import 'package:appointment_app/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:appointment_app/feature/auth/login/widget/email_and_password.dart';
import 'package:appointment_app/feature/auth/login/widget/login_bloc_listener.dart';
import 'package:appointment_app/feature/auth/login/widget/terms_and_conditon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void validateAndLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                const EmailAndPassword(),
                Column(
                  children: [
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                          style: const ButtonStyle(
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(0))),
                          onPressed: () {
                            //context.pushNamed(Routes.onBoarding);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyles.font13BlueRegular,
                          )),
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: 'Login',
                      onPressed: () {
                        validateAndLogin(context);
                      },
                      textStyle: TextStyles.font16WhiteSemiBold,
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    const LoginBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
