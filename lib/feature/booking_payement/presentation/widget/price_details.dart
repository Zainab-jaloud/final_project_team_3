 import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 327.sw, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Price Details',style: AppTextStyle.heading1.copyWith(fontSize: 16),),
        SizedBox(height: 16,),
        Row(children: [Text('Period time',style: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.locationColor),),Spacer(),
        Text('1 Month',style: AppTextStyle.optionLabelStyle.copyWith(color:Colors.black)),],),
        SizedBox(height: 8,),
          Row(children: [Text('Monthly payment',style: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.locationColor),),Spacer(),
          Text('\$320.00',style: AppTextStyle.optionLabelStyle.copyWith(color:Colors.black)),],),
          SizedBox(height: 8,),
            Row(mainAxisSize: MainAxisSize.max,children: [Text('Tax',
            style: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.locationColor),),Spacer(),
            Text('\$10.00',style: AppTextStyle.optionLabelStyle.copyWith(color:Colors.black)),]),
              SizedBox(height: 8,),
              Row(children: [Text('Total',style: AppTextStyle.optionValueStyle.copyWith(color: Colors.black,fontSize: 12),),Spacer(),Text('\$330.00',
              style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16,color: AppColors.secondaryColor),)],)
              ],
      ),
    );
  }
}