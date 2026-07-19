
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_svg/svg.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),height: 164,width: 224,child: Stack(
     children: [Image.asset(AppImages.house1),
     Container(
     width: 224,
     height: 164,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(16),
       gradient: LinearGradient(
         begin: Alignment.centerLeft,
         end: Alignment.bottomLeft,
         colors: [
           Color.fromRGBO(0,0,0,0),
         Color.fromRGBO(0,0,0,0.7),
         ],
       ),
     ),
        ),
     Positioned(top:83,
       
       child:Padding(
         padding: const EdgeInsets.all(16),
         child:  
           Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text('Ayana Homestay',style: TextStyle(color:Color(0xFFFFFFFF),fontSize: 14,
             fontWeight: FontWeight.w600,fontFamily: 'Inter' ),),
             Row(
               children: [SvgPicture.asset('assets/icons/Location2.svg'),
               SizedBox(width: 7,),
                 Text('Imogiri, Yogyakarta',style: TextStyle(color: Color(0xFFD2D6DB),fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Inter'),),
               
             
           ],),
        
          
           
         ],
               ),
       )),Positioned(top:108,right: 16,
            child: Container(width: 24,height: 24,decoration:BoxDecoration(color:Color(0xFFFFFFFF),borderRadius: BorderRadius.circular(27)),
               child:Center(child: SvgPicture.asset('assets/icons/Heart_red.svg'))),
          ),
       Positioned(top: 16,right: 16,
         child:Container(  padding: EdgeInsets.symmetric(horizontal: 12, vertical:6),
        alignment: Alignment.center,decoration: BoxDecoration(color: Color(0xFFFFFFFF),borderRadius: BorderRadius.circular(8)),
          child:  Text.rich(TextSpan(children: [TextSpan(text: '\$310',style: TextStyle(fontSize: 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',color:AppColors.secondaryColor)),TextSpan(text:'/month',
          style: TextStyle(color: Color(0xFF9DA4AE),fontSize: 10,fontWeight:FontWeight.w400,fontFamily: 'Inter'))])),
       ))
       
       
       
       ],
    ),
    
    
    
    
    
    
    );
  }
}