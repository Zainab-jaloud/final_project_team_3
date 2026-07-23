import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_svg/svg.dart';

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key, required this.icon, required this.text, 
    required this.index, required this.currentIndex, 
 required this.onTap, required this.selectedIcon,
    
  });
final String selectedIcon;
final  String icon;
final String text;
 final int index;
final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
     bool selected = currentIndex == index;
    return InkWell( onTap: () => onTap(index),child: Column(  mainAxisAlignment: MainAxisAlignment.center,
      children: [ Container(
          width: 28,
          height: 3,
          decoration: BoxDecoration(
            color:   selected ? AppColors.secondaryColor  : Colors.transparent,
            
          ),
        ),  const SizedBox(height: 8),
        SvgPicture.asset( selected ? selectedIcon: icon,
        colorFilter:  selected ? ColorFilter.mode(
   AppColors.secondaryColor, 
    BlendMode.srcIn,
  ):null,), 
         const SizedBox(height: 8),Text(  text,
            style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Inter',fontSize: 10,
              color: selected ?AppColors.secondaryColor :AppColors.locationColor,
            ),)],));
  }
}