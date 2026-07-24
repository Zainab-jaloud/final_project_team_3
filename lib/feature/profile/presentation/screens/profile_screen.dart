import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_app_bar.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_avatar.dart';
import 'package:flutter_application/feature/profile/presentation/widget/profile_menu_item.dart';
import 'package:flutter_application/feature/profile/presentation/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('saved_username') ?? '';
      _userEmail = prefs.getString('saved_email') ?? '';
    });
  }

  Future<void> _signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('remember_me');
    await prefs.remove('saved_email');
    await prefs.remove('saved_password');
    await prefs.remove('saved_username');
    await prefs.setBool('skip_onboarding', false);

    if (!mounted) return;
    context.go('/login');
  }

  void _goToEditProfile(BuildContext context) {
    context.push('/edit-profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const ProfileAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 32.h),
            ProfileAvatar(
              imagePath: 'assets/images/user_avatar.png',
              onCameraTap: () async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(), 
      ),
    );
    _loadUserData();
  },
            ),
            SizedBox(height: 16.h),
            Text(
              _userName,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                height: 18 / 14,
                color: AppColors.titleColor,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              _userEmail,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                height: 18 / 12,
                color: AppColors.locationColor,
              ),
            ),
            SizedBox(height: 32.h),
            Divider(
              height: 0.5.h,
              thickness: 0.5,
              color: AppColors.dotColor,
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
              onTap: _signOut,
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
                      color: AppColors.redHeartColor,
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