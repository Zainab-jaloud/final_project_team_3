import 'package:flutter/material.dart';
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
        Text(
          title,
          style: AppTextStyle.heading1.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8.h),
 
        Text(
          subtitle,
          style: AppTextStyle.optionLabelStyle.copyWith(
            overflow: TextOverflow.visible,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
 
      ],
    );
  }
}
