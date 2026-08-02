
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PersonsReviews extends StatelessWidget {
  const PersonsReviews({
    super.key, required this.name, required this.comment, required this.image,
  });
 final String name;
  
  final String comment;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 268,
    height: 104.h,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      color: AppColors.whiteColor,border:Border.all(color:AppColors.dotColor,width:1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
             radius:25,
              child: ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset(image)),
            ),
    
            const SizedBox(width: 12),
    
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Text(name,style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16)
        ),
                   Spacer(),  
           Row(spacing: 1,
            children: [SvgPicture.asset('assets/icons/Star.svg'),
           SvgPicture.asset('assets/icons/Star.svg'),
           SvgPicture.asset('assets/icons/Star.svg'),
           SvgPicture.asset('assets/icons/Star.svg'),
           SvgPicture.asset('assets/icons/Star2.svg')],)
                    ],
                  ),
    
                   
    
                  Text(
                    comment,
                    style:AppTextStyle.optionLabelStyle,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            )
          ],))
    
         );
  }
}
