import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final File? imageFile;
  final VoidCallback? onCameraTap;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.imageFile,
    this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115.r,
      height: 116.r,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: imageFile != null
                ? Image.file(
                    imageFile!,
                    width: 130.r,
                    height: 130.r,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    imagePath,
                    width: 130.r,
                    height: 130.r,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 8,
            child: GestureDetector(
              onTap: onCameraTap,
              child: Container(
                width: 28.r,
                height: 28.r,
                decoration:  BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/ic_camera.svg',
                    width: 18.r,
                    height: 18.r,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}