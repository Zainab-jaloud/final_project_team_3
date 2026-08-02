 import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class CancelSearchIcon extends StatelessWidget {
  final VoidCallback onTap;

  // ignore: use_super_parameters
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
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor, 
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Icon(
          Icons.clear_rounded, 
          color: Colors.white, 
          size: 13, 
        ),
      ),
    );
  }
}
