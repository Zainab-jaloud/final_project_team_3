import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
class CustomCheckbox extends StatelessWidget {
  final bool value;
  final double wid;
  final double hei;
  final double rad;
       double iconSize;
  final ValueChanged<bool> onChanged;

   CustomCheckbox({
    super.key,
    required this.wid,
    required this.hei, 
    required this.rad,
     required this.iconSize,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: wid,
        height: hei,
        decoration: BoxDecoration(
          color: value ? AppColors.secondaryColor : Colors.white,
          borderRadius: BorderRadius.circular(rad), 
          border: Border.all(
            color: value ? AppColors.secondaryColor : Colors.grey.shade400,
            width: 1.5,
          ),
        ),
        child: value
            ? Center(
              child:  Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                  size: iconSize,
              
                ),
            )
            : null,
      ),
    );
  }
}
