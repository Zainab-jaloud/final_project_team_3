import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class SuccessIconWidget extends StatelessWidget {
  const SuccessIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      height: 208.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // ignore: deprecated_member_use
        color: AppColors.primaryColor.withOpacity(0.15),
      ),
      child: Container(
        width: 166.w,
        height: 166.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.pagescolor, //.withOpacity(0.6),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/iconSuccess.svg',
            width: 170.w,
            height: 170.w,
          ),
        ),
      ),
    );
  }
}
