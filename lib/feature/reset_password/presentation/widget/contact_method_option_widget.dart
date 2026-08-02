import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';

class ContactMethodOptionWidget extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const ContactMethodOptionWidget({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.inputBorderColor,
            width: isSelected ? 1.5 : 1,
          ),
          color: AppColors.pagescolor,
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 44, height: 44),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyle.optionLabelStyle),
                  const SizedBox(height: 2),
                  Text(value, style: AppTextStyle.optionValueStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
