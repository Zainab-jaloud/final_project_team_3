import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class FinalDeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const FinalDeleteConfirmationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        'Confirm Deletion',
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          color: AppColors.titleColor,
        ),
      ),
      content: Text(
        'Are you sure you want to delete this conversation? This action cannot be undone.',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.sp,
          color: AppColors.locationColor,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'No',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColors.locationColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          child: Text(
            'Yes, Delete',
            style: TextStyle(
              fontFamily: 'Inter',
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
