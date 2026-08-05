import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget   implements PreferredSizeWidget {

  @override
   CustomAppBar({
    super.key,
    required this.title,
    required this.icon1,
    required this.icon2,
    required this.rightIcon1,
    required this.rightIcon2, this.onTap, this.onPressed,
    required this.onPageChanged,
  });
final VoidCallback ?onPageChanged;
  final String title;
  final String icon1;
  final String icon2;
  final bool rightIcon1;
  final bool rightIcon2;
  VoidCallback ?onTap;
  VoidCallback ?onPressed;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar( leading: Padding(
      padding: const EdgeInsets.all(18),
      child: InkWell(onTap:onPageChanged,
      child: SizedBox(width:24,height: 24,
      child: SvgPicture.asset('assets/icons/ArrowLeft.svg',width:12,height:15,))),
    ),
         
    title:Text(title,style: AppTextStyle.optionValueStyle.copyWith(fontSize: 17)),centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Row(spacing: 16,          
          children: [
            rightIcon1?InkWell(onTap:onTap,child: SvgPicture.asset(icon1)):SizedBox(),
          rightIcon2?InkWell(onTap:onPressed ,child: SvgPicture.asset(icon2,width: 24,height: 24,
        )):SizedBox()],
          
           ),
        )] );
  }
}