import 'package:flutter/material.dart';
 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
 
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
 
      width: 327.w,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          // ignore: deprecated_member_use
          disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.4),
          foregroundColor: Colors.white,
          // ignore: deprecated_member_use
          disabledForegroundColor: Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(text, style: AppTextStyle.buttonText),
 
      ),
    );
  }
}