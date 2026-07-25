import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class OnboardingImageStack extends StatelessWidget {
  final String photoImagePath;
  final double photoTop;
  final double photoLeft;
  final double photoWidth;
  final double photoHeight;

  final String tintedImagePath;
  final double tintedTop;
  final double tintedLeft;
  final double tintedWidth;
  final double tintedHeight;

  const OnboardingImageStack({
    super.key,
    required this.photoImagePath,
    required this.photoTop,
    required this.photoLeft,
    required this.photoWidth,
    required this.photoHeight,
    required this.tintedImagePath,
    required this.tintedTop,
    required this.tintedLeft,
    required this.tintedWidth,
    required this.tintedHeight,
  });

  static const double _radius = 85;
  static const double _tintedOpacity = 0.45;

  @override
  Widget build(BuildContext context) {
    final double stackHeight =
        [(photoTop + photoHeight), (tintedTop + tintedHeight)]
            .reduce((a, b) => a > b ? a : b);

    return SizedBox(
      width: 1.sw,
      height: stackHeight.h,
      child: Stack(
        children: [
          // الشكل الموف (تحت بالـ z-order) - Opacity 45%
          Positioned(
            top: tintedTop.h,
            left: tintedLeft.w,
            child: Opacity(
              opacity: _tintedOpacity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_radius.r),
                child: Image.asset(
                  tintedImagePath,
                  width: tintedWidth.w,
                  height: tintedHeight.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // الصورة الحقيقية (فوق دايمًا) - مع الظل
          Positioned(
            top: photoTop.h,
            left: photoLeft.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius.r),
                boxShadow: [
                  BoxShadow(
<<<<<<< HEAD
                    // ignore: deprecated_member_use
                    color: AppColors.primaryColor.withOpacity(0.3),
=======
                    color: AppColor.primary600.withOpacity(0.3),
>>>>>>> a9d77132ba55e488546814ea6afc9f1d4109e38c
                    offset: Offset(0, 24.h),
                    blurRadius: 48.r,
                    spreadRadius: -12.r,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_radius.r),
                child: Image.asset(
                  photoImagePath,
                  width: photoWidth.w,
                  height: photoHeight.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}