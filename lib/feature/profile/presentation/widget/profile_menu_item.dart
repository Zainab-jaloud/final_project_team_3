import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.w,
              height: 24.h,
              colorFilter:  ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  height: 18 / 12,
                  color: AppColors.titleColor,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 24.sp,
              color: AppColors.dotColor,
            ),
          ],
        ),
      ),
    );
  }
}