import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';

class PasswordFieldWidget extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const PasswordFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.errorText,
  });

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
 
        Text(widget.label, style: AppTextStyle.fasilitiesTextStyl.copyWith(fontSize: 14)),
 
        SizedBox(height: 6.h),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
 
          style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color:AppColors.titleColor),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color: AppColors.inputHintColor),
 
            errorText: widget.errorText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),

            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.inputHintColor,
                size: 20.sp,
              ),
              onPressed: () {
                setState(() => _obscureText = !_obscureText);
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.inputBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ],
    );
  }
}
