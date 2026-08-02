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

  static TextStyle bodyText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Color(0xFFD2D6DB),
  );
 

 
  static TextStyle otpBoxTextStyle = TextStyle(
 
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF101828),
  );
 
    static TextStyle buttonText = TextStyle(
    fontSize: 18.sp,
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
 

 
  
/////////////////////////////////////////////////////////////////////////////////////////////
  
 

 
 

   

  static TextStyle resendActionStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle fieldLabelStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    // color: const Color(0xFF344054),
 
    color: AppColors.titleColor,
  );

  // static TextStyle bodyText = TextStyle(
  //   //  fontFamily: 'Inter',
  //   fontSize: 14.sp,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.locationColor,
  // );

  // static TextStyle buttonText = TextStyle(
  //   fontFamily: 'Inter',
  //   fontSize: 18.sp,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.pagescolor,
  // );
  // static TextStyle otpBoxTextStyle = TextStyle(
  //   fontSize: 20.sp,
  //   fontWeight: FontWeight.w600,
  //   color: AppColors.titleColor,
  // );

  static TextStyle resendPromptStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.titleColor,
  );

  // static TextStyle resendActionStyle = TextStyle(
  //   fontSize: 14.sp,
  //   fontFamily: 'Inter',
  //   fontWeight: FontWeight.w400,
  // );
  // static TextStyle fieldLabelStyle = TextStyle(
  //   fontSize: 14.sp,
  //   fontFamily: 'Inter',
  //   fontWeight: FontWeight.w600,
  //   color: AppColors.titleColor,
  
  // );

  static TextStyle fieldInputStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
 
    fontFamily: 'Inter',
 
 
    color: AppColors.titleColor,
 
  );

  static TextStyle fieldHintStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
 
    fontFamily: 'Inter', 
    color: const Color(0xFF98A2B3),
  );

  static TextStyle fieldLabelStyleAuth = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter', 
    color: const Color(0xFF344054),
  );

   static TextStyle topCaption = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter', 
    color: const Color(0xFF1F2A37),
  );   //   color: AppColors.inputHintColor,
  // );
  static TextStyle successTitleStyle = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    color: AppColors.titleColor,
  );

  static TextStyle successDescriptionStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.locationColor,
  );

/////////////////////////////////////// Notifications feature ///////////////////////////////////////
  static TextStyle notificationSectionTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColors.titleColor,
  );

  static TextStyle notificationBodyStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: AppColors.locationColor,
  );

  static TextStyle notificationBoldSpanStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: AppColors.titleColor,
  );

  static TextStyle notificationNameBoldStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: AppColors.titleColor,
  );


  static TextStyle notificationEmptyTitleStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColors.titleColor,
  );

  static TextStyle reviewPropertyNameStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: AppColors.titleColor,
  );

  static TextStyle reviewPropertyAddressStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: AppColors.locationColor,
  );

  static TextStyle reviewHintStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: AppColors.locationColor,

  );
}