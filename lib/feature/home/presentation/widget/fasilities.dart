
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

class Fasilities extends StatelessWidget {
  const Fasilities({
    super.key, required this.icon, required this.name,  
  });
final String icon;
final String name;
  @override
  Widget build(BuildContext context) {
    return Container(  padding: EdgeInsets.symmetric(horizontal: 10),
      height: 30,decoration: BoxDecoration(
      color:AppColors.svgBackground,borderRadius: BorderRadius.circular(8)
    ),
    child: Row(spacing: 4,
      children: [SvgPicture.asset(icon),Text(name,maxLines: 1,style:AppTextStyle.fasilitiesTextStyl 
      ,
          )],),
    );
  }
}