import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class FilterActionButtons extends StatelessWidget {
  final VoidCallback onResetPressed;
  final VoidCallback onApplyPressed;

  const FilterActionButtons({
    super.key,
    required this.onResetPressed,
    required this.onApplyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      
        Expanded(
          child: OutlinedButton(
            onPressed: onResetPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
       
        Expanded(
          child: ElevatedButton(
            onPressed: onApplyPressed,
            style: ElevatedButton.styleFrom(
             
              backgroundColor: AppColors.primaryColor, 
              foregroundColor: Colors.white,
              minimumSize: const Size(0, 54),
              padding: const EdgeInsets.symmetric(horizontal: 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
