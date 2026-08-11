import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return InkWell( onTap: () => onTap(index),child: Column(  mainAxisAlignment: MainAxisAlignment.start,
      children: [ Container( 
          width: 28.w,
          height: 3.7.h,
          decoration: BoxDecoration(
            color:   selected ? AppColors.secondaryColor  : Colors.transparent,
            
          ),
        ),  
        SizedBox(height:20.h),
        SvgPicture.asset( selected ? selectedIcon: icon,
        colorFilter:  selected ? ColorFilter.mode(
   AppColors.secondaryColor, 
    BlendMode.srcIn,
  ):null,), 
         
          SizedBox(height:6.h),
         Text(  text,
            style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Inter',fontSize: 10.sp,
              color: selected ?AppColors.secondaryColor :AppColors.locationColor,
            ),)
            ,SizedBox(height: 4.h,)],));
  }
}