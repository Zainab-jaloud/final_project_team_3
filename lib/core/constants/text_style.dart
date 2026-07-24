import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle optionLabelStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.unselectedTextColor,
  );

  static TextStyle optionValueStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );

  static TextStyle heading1 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.titleColor,
  );

  static TextStyle bodyText = TextStyle(
    //  fontFamily: 'Inter',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.unselectedTextColor,
  );

  static TextStyle buttonText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.pagescolor,
  );
  static TextStyle otpBoxTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );

  static TextStyle resendPromptStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.titleColor,
  );

  static TextStyle resendActionStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static TextStyle fieldLabelStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );

  static TextStyle fieldInputStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.titleColor,
  );

  static TextStyle fieldHintStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.inputHintColor,
  );
  static TextStyle successTitleStyle = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );

  static TextStyle successDescriptionStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.unselectedTextColor,
  );
}
