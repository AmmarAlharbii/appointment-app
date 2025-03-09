import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/routing/route.dart';
import 'package:appointment_app/core/theme/colors.dart';
import 'package:appointment_app/core/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.login);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorManager.bluePrimary),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(
          Size(double.infinity, 52.sp),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }
}
