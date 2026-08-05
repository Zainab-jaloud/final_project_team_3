import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AgentInfo extends StatelessWidget {
  const AgentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 327.sw,height: 52,
    child: Row(children: [
      Container(width: 52,height: 52,decoration: BoxDecoration(borderRadius: BorderRadius.circular(52)),
      child: ClipRRect(borderRadius: BorderRadius.circular(52),child: Image.asset(AppImages.agent,fit: BoxFit.cover,),),),
             SizedBox(width: 16,),
    Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Esther Howard',style:AppTextStyle.optionValueStyle),
    Text('Real Estate Agent',
    style:AppTextStyle.optionLabelStyle),
     
     ]),
     Spacer(),
     SizedBox(width: 80,
       child: Row(spacing: 8,
         children: [
           Container(width: 36,height: 36,
           decoration: BoxDecoration(color: AppColors.svgBackground,borderRadius: BorderRadius.circular(55)),
           child:Center(child: GestureDetector(onTap: () {
             
           },
            child: SvgPicture.asset('assets/icons/call.svg'))),),
           Container(width: 36,height: 36,
           decoration: BoxDecoration(color: AppColors.svgBackground,borderRadius: BorderRadius.circular(55)),
           child:Center(child: GestureDetector(onTap: () => context.push('/chatdetails'),
             child: SvgPicture.asset('assets/icons/Chat.svg',colorFilter: ColorFilter.mode(AppColors.secondaryColor
             , BlendMode.srcIn),),
           )),),
         ],
       ),
     ) 
     ],),);
  }
}

