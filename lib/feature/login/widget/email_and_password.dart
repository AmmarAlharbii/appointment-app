import 'package:appointment_app/core/helpers/app_regex.dart';
import 'package:appointment_app/core/helpers/spacing.dart';
import 'package:appointment_app/core/widget/app_text_form_field.dart';
import 'package:appointment_app/feature/login/logic/cubit/login_cubit.dart';
import 'package:appointment_app/feature/login/widget/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  @override
  void initState() {
    super.initState();
    _emailController = context.read<LoginCubit>().emailController;
    _passwordController = context.read<LoginCubit>().passwordController;
    passwordListener();
  }

  void passwordListener() {
    _passwordController.addListener(() => setState(
          () {
            hasLowercase = AppRegex.hasLowerCase(_passwordController.text);
            hasUppercase = AppRegex.hasUpperCase(_passwordController.text);
            hasSpecialCharacters =
                AppRegex.hasSpecialCharacter(_passwordController.text);
            hasNumber = AppRegex.hasNumber(_passwordController.text);
            hasMinLength = AppRegex.hasMinLength(_passwordController.text);
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    print("object");
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Email',
              controller: _emailController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              hintText: 'Password',
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            verticalSpace(18),
            PasswordValidations(
                hasLowerCase: hasLowercase,
                hasUpperCase: hasUppercase,
                hasSpecialCharacters: hasSpecialCharacters,
                hasNumber: hasNumber,
                hasMinLength: hasMinLength)
          ],
        ));
  }
}
