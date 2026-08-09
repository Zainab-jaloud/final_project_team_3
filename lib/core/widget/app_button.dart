// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final VoidCallback? onPressed;
  final bool shadow;

  const AppButton({
    super.key,
    this.shadow = false,
    this.backgroundColor,
    this.textColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: shadow ? 9 : 0,
          shadowColor: shadow
              ? Color.fromARGB(37, 185, 130, 253)
              : Colors.transparent,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.4),
          foregroundColor: AppColors.pagescolor,
          disabledForegroundColor: Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Text(
            text,
            style: AppTextStyle.optionLabelStyle.copyWith(
              color: textColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
