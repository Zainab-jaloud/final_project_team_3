import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row( 
      children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Row( 
         children: [
           Text('Location',
           style:TextStyle(color: Color(0xFF9DA4AE),fontSize: 12,
           fontWeight: FontWeight.w500,fontFamily:'Inter'),),
           SizedBox(width: 8,),
           SvgPicture.asset('assets/icons/arrowDown.svg')
         ],
       ), SizedBox(height: 4,),
       Row(children: [SvgPicture.asset('assets/icons/Location1.svg'),SizedBox(width:7.5,),
       Text('Yogyakarta, Ind',style: TextStyle(color:AppColors.titleColor,fontSize: 16,fontWeight:FontWeight.w600,fontFamily: "Inter" ),)],)
      ],
    ),
    Spacer(),
     Row(children: [Container(width:44,height: 44,
     decoration: BoxDecoration(border: Border.all(color: Color(0xFFD2D6DB),width: 1),
      borderRadius: BorderRadius.circular(63),color: Color(0xFFFFFFFF))
       ,child:Stack(children: [Positioned(left: 26,top:5,
         child: Container(width:6,height: 6,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(33),
         color: Color(0xFFF04438)),),
       ), Center(child:SvgPicture.asset('assets/icons/Notification.svg',))],),
       
      ),
     
     SizedBox(width: 8,),
     
     
     
     
     
     
    Container(width:44,height: 44,
     decoration: BoxDecoration(border: Border.all(color: Color(0xFFD2D6DB),width: 1),
      borderRadius: BorderRadius.circular(63),color: Color(0xFFFFFFFF)),
      
         child:Center(child: SvgPicture.asset('assets/icons/Chat.svg')),
       
      ),],)    ],);
  }
}
