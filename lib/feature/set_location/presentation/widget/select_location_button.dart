import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectLocationButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SelectLocationButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,shadowColor:AppColors.secondaryColor ,
          backgroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primaryColor,
          foregroundColor:  AppColors.primaryColor,
          disabledForegroundColor: AppColors.primaryColor,
            // padding:const EdgeInsets.symmetric(vertical: 12.5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: AppColors.primaryColor,width:1,)
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:12.h ),
          child: Text(text, style:AppTextStyle.optionLabelStyle.copyWith(color: AppColors.primaryColor,fontSize: 18) ),
        ),
      ),
    );
  }
}