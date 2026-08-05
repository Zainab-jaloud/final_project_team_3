import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key, required this.address,
  });
final String ?address;

  @override
  Widget build(BuildContext context) {
    return Row( 
      children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Row( 
         children: [
           Text('Location',
           style:AppTextStyle.fasilitiesTextStyl.copyWith(color:AppColors.locationColor),),
           SizedBox(width: 8,),
           SvgPicture.asset('assets/icons/arrowDown.svg')
         ],
       ), SizedBox(height: 4,),
       Row(children: [SvgPicture.asset('assets/icons/Location1.svg'),SizedBox(width:7.5,),
       Text(address??'Yogyakarta, Ind',style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16),maxLines:1,
        )],)
      ],
    ),
    Spacer(),
     Row(children: [Container(width:44,height: 44,
     decoration: BoxDecoration(border: Border.all(color:AppColors.dotColor,width: 1),
      borderRadius: BorderRadius.circular(63),color:AppColors.whiteColor)
       ,child:Stack(children: [Positioned(left: 26,top:5,
         child: Container(width:6,height: 6,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(33),
         color:AppColors.redColor),),
       ), Center(child:GestureDetector(onTap: () {
         context.push('/notifications');
       },child: SvgPicture.asset('assets/icons/Notification.svg',)))],),
       
      ),
     
     SizedBox(width: 8,),
     
     
     
     
     
     
    Container(width:44,height: 44,
     decoration: BoxDecoration(border: Border.all(color:AppColors.dotColor,width: 1),
      borderRadius: BorderRadius.circular(63),color:AppColors.whiteColor),
      
         child:Center(child: GestureDetector(onTap: () => context.push('/messages'),child: SvgPicture.asset('assets/icons/Chat.svg'))),
       
      ),],)    ],);
  }
}
