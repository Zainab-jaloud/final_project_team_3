import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class FacilityContainer extends StatelessWidget {
  final IconData icon; 
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FacilityContainer({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 76,
        height: 64,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffE9D7FE) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.secondaryColor, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
