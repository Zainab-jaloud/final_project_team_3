import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const ResetHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.heading1),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppTextStyle.optionLabelStyle.copyWith(
            color: AppColors.dotColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
