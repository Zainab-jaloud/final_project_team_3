import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';

enum ProfileFieldType { text, email, date }

class ProfileTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ProfileFieldType type;
  final bool hasError;
  final VoidCallback? onTap;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    this.type = ProfileFieldType.text,
    this.hasError = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDate = type == ProfileFieldType.date;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 327.w,
          height: 18.h,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 15,
              height: 18 / 14,
              color: AppColors.titleColor,
            ),
          ),
        ),
        SizedBox(height:8.h),
        Container(
          width: 327.w,
          height: 52.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              width: 1.w,
              color: hasError ? AppColors.redHeartColor : AppColors.dotColor,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: isDate,
                  onTap: isDate ? onTap : null,
                  keyboardType: type == ProfileFieldType.email
                      ? TextInputType.emailAddress
                      : TextInputType.text,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    height: 18 / 14,
                    color: AppColors.titleColor,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (isDate) ...[
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  'assets/icons/ic_calendar.svg',
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}