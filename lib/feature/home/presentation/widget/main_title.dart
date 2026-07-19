
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';

class MainTitles extends StatelessWidget {
  const MainTitles({
    super.key, required this.title, required this.onTap,
  });
final String title;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
     Text(title,
     style: TextStyle(color:AppColors.titleColor,fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Inter')),
     Spacer(),
     TextButton(style: TextButton.styleFrom(
       padding: EdgeInsets.all(3),
       minimumSize: Size.zero,
       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
     ),
       onPressed:onTap, child:Text('See all',style: TextStyle(color:AppColors.secondaryColor,
     fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'Inter')))]);
  }
}