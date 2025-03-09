import 'package:appointment_app/core/theme/colors.dart';
import 'package:appointment_app/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.bluePrimary,
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.gray,
  );

  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
}
