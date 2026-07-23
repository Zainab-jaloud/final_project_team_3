import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle optionLabelStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFF101828),
  );

  static TextStyle optionValueStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Color(0xFF101828),
  );

  static TextStyle heading1 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xFF101828),
  );

  static TextStyle bodyText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFFD2D6DB),
  );
    static TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: 'Inter'
  );
////////////////////////////////////////////////////////////////////////////////  
  static TextStyle titleTextStyl=  
  TextStyle(fontWeight: FontWeight.w600,
  fontSize: 16,color: AppColors.titleColor,
  fontFamily: 'Inter');

  static TextStyle priceTextStyl=  TextStyle(fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',color:AppColors.secondaryColor);

  static TextStyle locationTextStyl=  TextStyle(fontFamily: 'Inter',fontSize: 14,
          fontWeight: FontWeight.w400,color: AppColors.locationColor,
          overflow: TextOverflow.ellipsis);
 

  static TextStyle fasilitiesTextStyl=TextStyle(fontWeight: FontWeight.w500,fontSize: 12,
          color: AppColors.titleColor,fontFamily: 'Inter');
  }