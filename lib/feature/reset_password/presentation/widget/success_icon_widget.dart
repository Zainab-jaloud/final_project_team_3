// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class SuccessIconWidget extends StatelessWidget {
  const SuccessIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      height: 200.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.12),
            ),
          ),

          Container(
            width: 165.w,
            height: 165.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.pagescolor,
            ),
          ),

          Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.locationColor.withOpacity(0.60),
                  blurRadius: 20.r,
                  spreadRadius: 2.r,
                ),
              ],
            ),
          ),

          SizedBox(
            width: 200.w,
            height: 200.h,
            child: FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, 16),
                child: SvgPicture.asset(
                  'assets/icons/iconSuccess.svg',
                  colorFilter: ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
