import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget   implements PreferredSizeWidget {

  @override
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon1,
    required this.icon2,
    required this.rightIcon1,
    required this.rightIcon2,
  });

  final String title;
  final String icon1;
  final String icon2;
  final bool rightIcon1;
  final bool rightIcon2;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar( leading: Padding(
      padding: const EdgeInsets.all(18),
      child: InkWell(onTap: () => (context).pop(),child: SizedBox(width:24,height: 24,child: SvgPicture.asset('assets/icons/ArrowLeft.svg',width:12,height:15,))),
    ),
         
    title:Text(title,style: TextStyle(fontFamily:'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.titleColor),),centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Row(spacing: 16,          
          children: [
            rightIcon1?SvgPicture.asset(icon1):SizedBox(),
          rightIcon2?SvgPicture.asset(icon2):SizedBox()],
          
           ),
        )] );
  }
}