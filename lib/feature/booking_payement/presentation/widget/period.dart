import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Period extends StatelessWidget {
  const Period({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 327.sw,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Period',style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16),),
        SizedBox(height: 16,),
        SizedBox(width: 331.w,
          child: Row(children: [ Container(width:36,height:36,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:AppColors.svgBackground,
          ),
          child: Padding(padding: EdgeInsets.all(6),
          child: SvgPicture.asset('assets/icons/Calendar.svg',)),),
          SizedBox(width: 12,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Date',style:AppTextStyle.optionLabelStyle,),
          Text('12 Aug - 12 Sep',style:AppTextStyle.optionValueStyle,),],) ,
          Spacer(),
         SvgPicture.asset('assets/icons/arrow_foraward.svg')
           ]),
           
        ),
        SizedBox(height: 12,),
        Divider(color: AppColors.borderColor,thickness: 0.5,
        ),
        SizedBox(height: 12,),
        Text('Make sure to check your date before making any\nsort of payments',style:AppTextStyle.optionLabelStyle,)
      ],),
    );
  }
}