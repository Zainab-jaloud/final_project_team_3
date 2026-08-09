import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';

class ResendCodeWidget extends StatelessWidget {
  final VoidCallback onResend;

  const ResendCodeWidget({super.key, required this.onResend});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Don't receive code?",
            style: AppTextStyle.optionLabelStyle.copyWith(
              color: AppColors.titleColor,
              fontSize: 14,
            ),
          ),

          GestureDetector(
            onTap: onResend,
            child: Text(
              'Resend code',

              style: AppTextStyle.optionValueStyle.copyWith(
                color: AppColors.redHeartColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
