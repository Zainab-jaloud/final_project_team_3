import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';

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
            child:  Text(
              'Reset',
              style:AppTextStyle.fasilitiesTextStyl.copyWith(fontSize: 18,color: AppColors.locationColor),
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
            child:  Text(
              'Apply',
              style:AppTextStyle.optionValueStyle.copyWith(color: AppColors.whiteColor,fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
