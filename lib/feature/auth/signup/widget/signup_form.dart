import 'package:appointment_app/core/helpers/app_regex.dart';
import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/helpers/spacing.dart';
import 'package:appointment_app/core/routing/route.dart';
import 'package:appointment_app/core/theme/style.dart';
import 'package:appointment_app/core/widget/app_text_button.dart';
import 'package:appointment_app/core/widget/app_text_form_field.dart';
import 'package:appointment_app/core/widget/error_dialog.dart';
import 'package:appointment_app/core/widget/loading_dialog.dart';
import 'package:appointment_app/feature/auth/login/logic/cubit/login_state.dart';
import 'package:appointment_app/feature/auth/login/widget/password_validations.dart';
import 'package:appointment_app/feature/auth/signup/data/model/signup_request_body.dart';
import 'package:appointment_app/feature/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:appointment_app/feature/auth/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(_passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(_passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(_passwordController.text);
        hasNumber = AppRegex.hasNumber(_passwordController.text);
        hasMinLength = AppRegex.hasMinLength(_passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: _nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid phone number';
              }
            },
            controller: _phoneNumberController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: _emailController,
          ),
          verticalSpace(18),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) => AppTextFormField(
              controller: _passwordController,
              hintText: 'Password',
              isObscureText: state.maybeWhen(
                passwordVisability: (isObscureText) => isObscureText,
                orElse: () => true,
              ),
              suffixIcon: GestureDetector(
                onTap: () =>
                    context.read<SignupCubit>().changePasswordVisibility(),
                child: Icon(
                  state.maybeWhen(
                    passwordVisability: (isObscureText) {
                      return isObscureText;
                    },
                    orElse: () => true,
                  )
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: _passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(40),
          BlocListener<SignupCubit, SignupState>(
            listenWhen: (previous, current) =>
                current is SignupSuccess ||
                current is SignupError ||
                current is SignupLoading,
            listener: (context, state) {
              state.whenOrNull(
                signupLoading: () => showDialog(
                  context: context,
                  builder: (context) => const LoadingDialog(),
                ),
                signupError: (error) {
                  context.pop();

                  showDialog(
                    context: context,
                    builder: (context) => ErrorDialog(message: error),
                  );
                },
                signupSuccess: (data) {
                  context.pop();

                  context.pushReplacementNamed(Routes.home);
                },
              );
            },
            child: AppTextButton(
              buttonText: "Create Account",
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                context
                    .read<SignupCubit>()
                    .validateThenSignup(SignupRequestBody(
                      name: _nameController.text,
                      phone: _phoneNumberController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                      passwordConfirmation:
                          _passwordConfirmationController.text,
                      gender: 1,
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
