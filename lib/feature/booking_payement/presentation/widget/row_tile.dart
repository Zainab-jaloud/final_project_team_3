import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

class RowTile extends StatelessWidget {
  const RowTile({
    super.key, required this.leftIcon, required this.rightIcon, required this.text, required this.onTap,
  });
final String  leftIcon;
final String  rightIcon;
final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(children: [ Container(width:36,height:36,decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20),
       color:AppColors.svgBackground,
     ),
     child: Padding(padding: EdgeInsets.all(6),
     child: SvgPicture.asset(leftIcon)),),
     SizedBox(width: 16,),
          Text(text,style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 15,color: AppColors.titleColor),) ,
     Spacer(),
    GestureDetector(onTap: onTap,child: SvgPicture.asset(rightIcon))
      ]);
  }
}