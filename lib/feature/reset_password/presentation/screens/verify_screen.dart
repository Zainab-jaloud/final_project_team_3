import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:go_router/go_router.dart';
import '../widget/reset_header_widget.dart';
import '../widget/resend_code_widget.dart';
import '../widget/otp_input_widget.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String otpCode = '';

  @override
  Widget build(BuildContext context) {
    final bool isCodeComplete = otpCode.length == 4;

    return Scaffold(
      backgroundColor: AppColors.pagescolor,
      appBar: CustomAppBar(
        title: '',
        icon1: '',
        icon2: '',
        rightIcon1: false,
        rightIcon2: false,
        onPageChanged: () {
          context.go('/reset-password');
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ResetHeaderWidget(
                        title: 'Verify your Email',
                        subtitle:
                            'Please enter 6 digit verification that have been sent to your email address',
                      ),
                      SizedBox(height: 135.h),
                      OtpInputWidget(
                        length: 4,
                        onCompleted: (code) {
                          setState(() => otpCode = code);
                        },
                      ),
                      SizedBox(height: 25.h),
                      ResendCodeWidget(
                        onResend: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Code resent successfully'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h, top: 12.h),
                child: AppButton(
                  text: 'Verify',
                  onPressed: isCodeComplete
                      ? () {
                          context.go('/create-new-password');
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
