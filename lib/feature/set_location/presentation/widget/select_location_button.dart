import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectLocationButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SelectLocationButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
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
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.primaryColor,width:1,)
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:2.5.h ),
          child: Text(text, style:TextStyle(color:AppColors.primaryColor,  fontSize: 18.sp,
          fontWeight: FontWeight.w400,)),
        ),
      ),
    );
  }
}