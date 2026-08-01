import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.4),
          foregroundColor: AppColors.pagescolor,
          disabledForegroundColor: Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.5.h),
          child: Text(
            text,
            style: AppTextStyle.optionLabelStyle.copyWith(
              color: AppColors.whiteColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
