import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:go_router/go_router.dart';

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pagescolor,
      appBar: CustomAppBar(
        title: 'Notification',
        icon1: '',
        icon2: '',
        rightIcon1: false,
        rightIcon2: false, onPageChanged: () { context.pop(); },

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            SvgPicture.asset(
              'assets/icons/notification_empty_opps_text.svg',
              width: 98.w,
              height: 35.h,
            ),
            SizedBox(height: 16.h),
            Image.asset(
              AppImages.notificationEmptyIllustration,
              width: 274.w,
              height: 202.h,
            ),
            SizedBox(height: 32.h),
            Text(
              'No notification yet',
              style: AppTextStyle.optionValueStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 289.w,
              child: Text(
                'All notification we send will appear here, so you can view them easily anytime.',
                style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}