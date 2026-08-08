import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/feature/reset_password/presentation/widget/success_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:go_router/go_router.dart';

class SuccessResetScreen extends StatelessWidget {
  const SuccessResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pagescolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SuccessIconWidget(),
                    SizedBox(height: 24.h),
                    Text(
                      'Success!',
                      textAlign: TextAlign.center,
                    style: AppTextStyle.optionValueStyle.copyWith(fontSize: 24),
 
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'You password has been changed. Please \nlog in again with a new password.',
                      textAlign: TextAlign.center,
 
                      style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14),
 
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h, top: 12.h),
                child: AppButton(textColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                  text: 'Continue', onPressed: () {(context).push('/login');}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
