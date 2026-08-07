import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class CancelSearchIcon extends StatelessWidget {
  final VoidCallback onTap;

  const CancelSearchIcon({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8), 
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor, 
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Icon(
          Icons.clear_rounded, 
          color: Colors.white, 
          size: 13, weight: 10.0,
        ),
      ),
    );
  }
}
