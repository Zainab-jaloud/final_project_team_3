
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoBooking extends StatelessWidget {
  const NoBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox( width: 295.w,
          child: Column(mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Image.asset(
                         AppImages.opps,
               
              ),
              SizedBox(height: 42,),
              Text('You have no upcoming booking',
              style:AppTextStyle.optionValueStyle.copyWith(fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(height:16,),
              Text.rich(  textAlign: TextAlign.center,
                TextSpan(children:[TextSpan(text:'are you looking fo a ',style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14)),
              TextSpan(text:'completed',style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color:AppColors.secondaryColor)),
              TextSpan(text: ' or ',style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14)),
              TextSpan(text:'cancelled ',
              style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14,color:AppColors.secondaryColor)),
              TextSpan(text: 'booking ?',style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14)), 
              ])),
          SizedBox(height: 55.h,)  ],
          ),
        ),
      );
  }
}