import 'package:appointment_app/core/helpers/spacing.dart';
import 'package:appointment_app/core/theme/style.dart';
import 'package:appointment_app/core/widget/app_text_button.dart';
import 'package:appointment_app/feature/auth/login/widget/terms_and_conditon.dart';
import 'package:appointment_app/feature/auth/signup/widget/already_have_account_text.dart';
import 'package:appointment_app/feature/auth/signup/widget/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36),
              const SignupForm(),
              verticalSpace(16),
              const TermsAndConditionsText(),
              verticalSpace(10),
              const Center(child: AlreadyHaveAccountText()),
            ],
          ),
        ),
      ),
    ));
  }
}
