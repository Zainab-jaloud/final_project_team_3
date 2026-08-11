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
 @override
void initState() {
  super.initState();

  Timer(const Duration(seconds: 3), () async {
    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();

final rememberMe =
    prefs.getBool('skip_onboarding') ?? false;

final hasSeenOnboarding =
    prefs.getBool('hasSeenOnboarding') ?? false;

 

if (rememberMe) {
  
  context.go('/home');
} else if (!hasSeenOnboarding) {
  
  context.go('/onboarding');
} else {
  
  context.go('/login');
}
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
 
          Positioned(
            left: 148.w,
            top: 327.h,
            child: SvgPicture.asset(
              'assets/icons/splash_logo.svg',
              width: 80.w,
              height: 105.h,
            ),
          ),

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
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
 
                  height: 32 / 24,
                  letterSpacing: 24.sp * 0.16,
 
                  color: AppColors.titleColor,
  
 
                  
 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}