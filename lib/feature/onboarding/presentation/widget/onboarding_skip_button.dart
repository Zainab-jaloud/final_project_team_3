import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingSkipButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
<<<<<<< HEAD
          side: BorderSide(color: AppColors.borderColor, width: 1.w),
=======
          side: BorderSide(color: AppColor.neutralGray200, width: 1.w),
>>>>>>> a9d77132ba55e488546814ea6afc9f1d4109e38c
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        child: Text(
          'Skip',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            height: 18 / 12,
<<<<<<< HEAD
            color: AppColors.neutralGray600,
=======
            color: AppColor.neutralGray600,
>>>>>>> a9d77132ba55e488546814ea6afc9f1d4109e38c
          ),
        ),
      ),
    );
  }
}