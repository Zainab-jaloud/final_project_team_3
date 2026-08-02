import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle optionLabelStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.locationColor,
    overflow: TextOverflow.ellipsis
 
  );
static TextStyle fasilitiesTextStyl=TextStyle(fontWeight: FontWeight.w500,
fontSize: 12,
          color: AppColors.titleColor,
          fontFamily: 'Inter');
  
  static TextStyle optionValueStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
    fontFamily: 'Inter'
 
  );

  static TextStyle heading1 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
 
    color:AppColors.titleColor,
  );


///////////////////////// 

 
 

   

  // static TextStyle resendActionStyle = TextStyle(
  //   fontSize: 14.sp,
  //   fontWeight: FontWeight.w600,
  // );
  // static TextStyle fieldLabelStyle = TextStyle(
  //   fontSize: 14.sp,
  //   fontWeight: FontWeight.w500,
  //   // color: const Color(0xFF344054),
 
  //   color: AppColors.titleColor,
  // );

 

  // static TextStyle resendPromptStyle = TextStyle(
  //   fontSize: 14.sp,
  //   fontFamily: 'Inter',
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.titleColor,
  // );

  
/////////////////////////////////////////////////////
  // static TextStyle fieldInputStyle = TextStyle(
  //   fontSize: 14.sp,
  //   fontWeight: FontWeight.w400,
 
  //   fontFamily: 'Inter',
 
 
  //   color: AppColors.titleColor,
 
  // );

  // static TextStyle fieldHintStyle = TextStyle(
  //   fontSize: 14.sp,
  //   fontWeight: FontWeight.w400,
 
  //   fontFamily: 'Inter', 
  //   color: AppColors.inputHintColor,
  // );

  // static TextStyle fieldLabelStyleAuth = TextStyle(
  //   fontSize: 14.sp,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: 'Inter', 
  //   color:  AppColors.fieldlabel,
  // );

  
}
 
