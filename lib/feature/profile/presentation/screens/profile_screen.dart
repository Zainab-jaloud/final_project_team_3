import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_app_bar.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_avatar.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_menu_item.dart';
import 'package:flutter_application/feature/profile/presentation/screens/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _goToEditProfile(BuildContext context) {
    context.push('/edit-profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const ProfileAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 32.h),
            ProfileAvatar(
              imagePath: 'assets/images/user_avatar.png',
              onCameraTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(), 
      ),
    );
  },
            ),
            SizedBox(height: 16.h),
            Text(
              'Brooklyn Simmons',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                height: 18 / 14,
                color: AppColor.neutralGray800,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'brooklynsim@gmail.com',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                height: 18 / 12,
                color: AppColor.neutralGray400,
              ),
            ),
            SizedBox(height: 32.h),
            Divider(
              height: 0.5.h,
              thickness: 0.5,
              color: AppColor.neutralGray300,
            ),
            SizedBox(height: 8.h),
            ProfileMenuItem(
              iconPath: 'assets/icons/ic_settings.svg',
              label: 'Settings',
              onTap: () {},
            ),
            ProfileMenuItem(
              iconPath: 'assets/icons/ic_payment.svg',
              label: 'Payment',
              onTap: () {},
            ),
            ProfileMenuItem(
              iconPath: 'assets/icons/ic_notification.svg',
              label: 'Notification',
              onTap: () {},
            ),
            ProfileMenuItem(
              iconPath: 'assets/icons/ic_recent_viewed.svg',
              label: 'Recent Viewed',
              onTap: () {},
            ),
            ProfileMenuItem(
              iconPath: 'assets/icons/ic_about.svg',
              label: 'About',
              onTap: () {},
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Center(
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      height: 24 / 16,
                      color: AppColor.error500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}