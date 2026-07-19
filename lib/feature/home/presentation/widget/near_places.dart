import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_svg/svg.dart';

class NearPlaces extends StatelessWidget {
  const NearPlaces({
    super.key, required this.isPopular,
  });
final bool isPopular;
  @override
  Widget build(BuildContext context) {
    return Container( padding: const EdgeInsets.only(bottom: 12),  
      decoration: BoxDecoration( border: const Border(
       bottom: BorderSide(
         color: Color(0xFFE5E7EB),
         width: 1,
       ),
     )),
     
     child: Row(crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       ClipRRect(
         borderRadius: BorderRadius.circular(6),
         child: Image.asset(
           AppImages.house1,
           width: 80,
           height:62,
           fit: BoxFit.scaleDown,
         ),
       ),SizedBox(width: 12,),
     Expanded(
       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
         children: [Row(
           children: [
             Expanded(
               child: Text('Maharani Villa Yogyakarta',style: TextStyle(color: AppColors.titleColor,
                 fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Inter'),  maxLines: 1,
                     overflow: TextOverflow.ellipsis,),
             ),
       isPopular?Transform.translate(
  offset: const Offset(-7, 0),  
  child: SvgPicture.asset(
    'assets/icons/Heart_red.svg',
    width: 19,
    height: 18,
  ),
):SizedBox(),
           ],
         ),SizedBox(height:2,),
       Row(spacing: 4,
         children: [SvgPicture.asset('assets/icons/Location2.svg',colorFilter: ColorFilter.mode(AppColors.locationColor,BlendMode.srcIn,),),
           SizedBox(width: 110,
             child: Text('Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,',
              overflow: TextOverflow.ellipsis,maxLines:1,
              style: TextStyle(fontFamily:'Inter',fontSize: 10,fontWeight: FontWeight.w400,color:AppColors.locationColor),),
           ),
         ],
       ),SizedBox(height: 4,),
       Row(
         children: [
           Text('\$320/month',style: TextStyle(fontWeight: FontWeight.w600,
           fontSize: 10,fontFamily:'Inter',
           color:AppColors.titleColor),),Spacer(),
           
         Padding(
           padding: const EdgeInsets.only(right:8),
           child: Container(width:35,height: 18, 
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color(0xFFFFFAEB)),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,children: [SvgPicture.asset('assets/icons/Star.svg'),
             Text('4.5',style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,fontFamily: 'Inter'),)],),
           ),
         )
         ],
       )],),
     )
    ],),);
  }
}
