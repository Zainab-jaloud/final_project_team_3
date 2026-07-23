import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const OnboardingPageIndicator({
    super.key,
    required this.pageCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        final bool isActive = index == currentIndex;
        return Padding(
          padding: EdgeInsets.only(right: index == pageCount - 1 ? 0 : 8.w),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: isActive ? 28.w : 10.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: isActive ? AppColor.primaryColor : AppColor.neutralGray300,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        );
      }),
    );
  }
}