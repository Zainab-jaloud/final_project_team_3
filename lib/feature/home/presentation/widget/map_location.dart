import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_svg/svg.dart';

class MapLocation extends StatelessWidget {
  const MapLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children:[ ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.asset(AppImages.map)),
    Positioned(top: 83,
     left:135,
     child: SvgPicture.asset('assets/icons/Location1.svg',width: 12,height: 15,colorFilter: 
     ColorFilter.mode(AppColors.starColor,BlendMode.srcIn),))]);
  }
}