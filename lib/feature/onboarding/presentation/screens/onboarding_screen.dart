import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_application/feature/onboarding/presentation/widget/onboarding_image_stack.dart';
import 'package:flutter_application/feature/onboarding/presentation/widget/onboarding_page_indicator.dart';
import 'package:flutter_application/feature/onboarding/presentation/widget/onboarding_skip_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
  
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _OnboardingPageData {
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

  final String titleBefore;
  final String titleBold;
  final String titleAfter;
  final String subtitle;
  final bool showSkip;
  final String buttonText;

  const _OnboardingPageData({
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
    required this.titleBefore,
    required this.titleBold,
    required this.titleAfter,
    required this.subtitle,
    required this.showSkip,
    required this.buttonText,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  static const List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      photoImagePath: 'assets/images/onboarding_1_back.png',
      photoTop: 116,
      photoLeft: 72,
      photoWidth: 149.68,
      photoHeight: 230.51,
      tintedImagePath: 'assets/images/onboarding_1_front.png',
      tintedTop: 183.49,
      tintedLeft: 153.32,
      tintedWidth: 149.68,
      tintedHeight: 230.51,
      titleBefore: 'Find the ',
      titleBold: 'perfect place',
      titleAfter: ' for your future house',
      subtitle:
          'find the best place for your dream house with your family and loved ones',
      showSkip: true,
      buttonText: 'Next',
    ),
    _OnboardingPageData(
      photoImagePath: 'assets/images/onboarding_2_front.png',
      photoTop: 116,
      photoLeft: 153.22,
      photoWidth: 149.78,
      photoHeight: 230.51,
      tintedImagePath: 'assets/images/onboarding_2_back.png',
      tintedTop: 183.49,
      tintedLeft: 72,
      tintedWidth: 149.78,
      tintedHeight: 230.51,
      titleBefore: 'Fast sell your property in just ',
      titleBold: 'one click',
      titleAfter: '',
      subtitle: 'Simplify the property sales process with just your smartphone',
      showSkip: true,
      buttonText: 'Next',
    ),
    _OnboardingPageData(
      photoImagePath: 'assets/images/onboarding_3_back.png',
      photoTop: 116,
      photoLeft: 85,
      photoWidth: 149.68,
      photoHeight: 230.51,
      tintedImagePath: 'assets/images/onboarding_3_front.png',
      tintedTop: 183.49,
      tintedLeft: 166.32,
      tintedWidth: 149.68,
      tintedHeight: 230.51,
      titleBefore: 'find your ',
      titleBold: 'dream home',
      titleAfter: ' with us',
      subtitle:
          'Just search and select your favorite property you want to locate',
      showSkip: false,
      buttonText: 'Get Started',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 
  Future<void> _goToLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    if (!mounted) return;

    context.go('/profile');

    context.go('/login');
  }

  void _onNextPressed() {
    if (_currentIndex == _pages.length - 1) {
      _goToLogin();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 60.h),
                      OnboardingImageStack(
                        photoImagePath: page.photoImagePath,
                        photoTop: page.photoTop,
                        photoLeft: page.photoLeft,
                        photoWidth: page.photoWidth,
                        photoHeight: page.photoHeight,
                        tintedImagePath: page.tintedImagePath,
                        tintedTop: page.tintedTop,
                        tintedLeft: page.tintedLeft,
                        tintedWidth: page.tintedWidth,
                        tintedHeight: page.tintedHeight,
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: 259.w,
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp,
                              height: 32 / 24,
                              color: AppColors.titleColor,
                            ),
                            children: [
                              TextSpan(text: page.titleBefore),
                              TextSpan(
                                text: page.titleBold,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: page.titleAfter),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: 259.w,
                        child: Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            height: 18 / 12,
                            color: AppColors.locationColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      OnboardingPageIndicator(
                        pageCount: _pages.length,
                        currentIndex: _currentIndex,
                      ),
                    ],
                  ),
                );
              },
            ),

            if (_pages[_currentIndex].showSkip)
              Positioned(
                top: 60.h,
                left: 294.w,
                child: OnboardingSkipButton(onPressed: _goToLogin),
              ),

            Positioned(
              bottom: 10.h,
             left: 24.w,
  right: 24.w,
              child: AppButton(textColor:AppColors.whiteColor,
              backgroundColor: AppColors.primaryColor,
                text: _pages[_currentIndex].buttonText,
                onPressed: _onNextPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}