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
          Text("Don't receive code?", style: AppTextStyle.resendPromptStyle),
          GestureDetector(
            onTap: onResend,
            child: Text(
              'Resend code',
              style: AppTextStyle.resendActionStyle.copyWith(
                color: AppColors.resendCode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
