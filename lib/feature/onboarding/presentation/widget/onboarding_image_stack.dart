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
          Positioned(
            top: tintedTop.h,
            left: tintedLeft.w,
            child: Opacity(
              opacity: _tintedOpacity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_radius.r),
                child: Image.asset(
                  tintedImagePath,
                  width: tintedWidth.r,
                  height: tintedHeight.r,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: photoTop.h,
            left: photoLeft.w,
            child: Container(
              width: photoWidth.r,
              height: photoHeight.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius.r),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppColors.primaryColor.withOpacity(0.3),
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
                  width: photoWidth.r,
                  height: photoHeight.r,
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