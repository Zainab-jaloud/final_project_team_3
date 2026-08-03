import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PhotoUploadBox extends StatelessWidget {
  const PhotoUploadBox({super.key, required this.image, required this.onTap});

  final File? image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DashedBorderBox(
      onTap: onTap,
      child: image != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.file(
                image!,
                width: 327.w,
                height: 139.h,
                fit: BoxFit.cover,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/upload_cloud.svg',
                  width: 60.w,
                  height: 60.w,
                ),
                SizedBox(height: 8.h),
                Text('Click here to upload', style: AppTextStyle.optionLabelStyle),
              ],
            ),
    );
  }
}

class DashedBorderBox extends StatelessWidget {
  const DashedBorderBox({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedBorderPainter(color: AppColors.dotColor, radius: 12.r),
        child: Container(
          width: 327.w,
          height: 139.h,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);
    final dashPath = Path();

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + 4;
        dashPath.addPath(metric.extractPath(distance, next), Offset.zero);
        distance = next + 4;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}