import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyCardWidget extends StatelessWidget {
  const PropertyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Image.asset(
        'assets/images/card.png',
        width: 220.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
