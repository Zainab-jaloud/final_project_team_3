import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText; 
  final Widget? suffixIcon; 
  final ValueChanged<String>? onSubmitted; 
  final bool autofocus;

  const CustomSearchField({
    super.key,
     this.controller,
    required this.hintText,
    this.suffixIcon,
    this.onSubmitted,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( vertical: 5.0.h),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: autofocus,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(14.r),
                hintText: hintText, 
                hintStyle: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Center(child: SvgPicture.asset('assets/icons/Search.svg')),
                  ),
                ),
                suffixIcon: suffixIcon, 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.dotColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: AppColors.dotColor),
                ),
              ),
              onSubmitted: onSubmitted, 
            ),
          ),
        ],
      ),
    );
  }
}
