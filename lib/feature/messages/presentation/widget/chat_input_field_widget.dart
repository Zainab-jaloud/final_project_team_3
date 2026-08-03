import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';

class ChatInputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAddTap;
  final VoidCallback onSendTap;

  const ChatInputFieldWidget({
    super.key,
    required this.controller,
    required this.onAddTap,
    required this.onSendTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onAddTap,
          child: SvgPicture.asset(
            'assets/icons/Vector.svg',
            width: 17.w,
            height: 17.h,
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.borderColor,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: TextField(
              controller: controller,
              style: AppTextStyle.optionValueStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.titleColor,
              ),
              decoration: InputDecoration(
                hintText: 'write your message',
                hintStyle: AppTextStyle.optionValueStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.locationColor,
                  fontSize: 13,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: onSendTap,
          child: Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                width: 23.w,
                height: 23.h,
                'assets/icons/Send.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
