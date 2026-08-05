import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle optionLabelStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.locationColor,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle fasilitiesTextStyl = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: AppColors.titleColor,
    fontFamily: 'Inter',
  );

  static TextStyle optionValueStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
    fontFamily: 'Inter',
  );

  static TextStyle heading1 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,

    color: AppColors.titleColor,
  );
}
