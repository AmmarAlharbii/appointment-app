import 'package:appointment_app/core/helpers/spacing.dart';
import 'package:appointment_app/core/theme/style.dart';
import 'package:appointment_app/core/widget/app_text_button.dart';
import 'package:appointment_app/core/widget/app_text_form_field.dart';
import 'package:appointment_app/feature/login/widget/terms_and_conditon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: 'Email',
                        validator: (value) {},
                      ),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'Password',
                        validator: (value) {},
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
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
                        onPressed: () {},
                        textStyle: TextStyles.font16WhiteSemiBold,
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
