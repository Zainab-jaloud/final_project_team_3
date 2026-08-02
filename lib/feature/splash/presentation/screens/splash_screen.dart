// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_application/core/constants/app_color.dart';

import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), ()async  {
      if (mounted) {
        final prefs = await SharedPreferences.getInstance();
// التاكد ان اختار المستخدم تذكرني
        bool skipOnboarding = prefs.getBool('skip_onboarding') ?? false;
//يفحص قيمة المتغير اذا كانت ترو سينتقل الى الهوم واذا لا بينتقل للاون بوردينغ 
      if (skipOnboarding) {
          context.go('/home');}
      else {
        context.go('/onboarding');
      }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // الأيقونة (Logo) - Width 80, Height 105, Top 327, Left 148
          Positioned(
            left: 148.w,
            top: 327.h,
            child: SvgPicture.asset(
              'assets/icons/splash_logo.svg',
              width: 80.w,
              height: 105.h,
            ),
          ),

          // النص "HOUSELY" - Width 137, Height 32, Top 453, Left 119
          Positioned(
            left: 119.w,
            top: 453.h,
            child: SizedBox(
              width: 137.w,
              height: 32.h,
              child: Text(
                'HOUSELY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800, // ExtraBold
                  fontSize: 24.sp,
                  height: 32 / 24, // line-height ÷ font-size
                  letterSpacing: 24.sp * 0.16, // 16% letter spacing
 
                  color: AppColors.titleColor,
 
                  // color: AppColor.neutralGray800,
 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}