import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: value ? AppColors.secondaryColor : Colors.white,
          borderRadius: BorderRadius.circular(5), 
          border: Border.all(
            color: value ? AppColors.secondaryColor : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: value
            ? const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 10, 
              )
            : null,
      ),
    );
  }
}
