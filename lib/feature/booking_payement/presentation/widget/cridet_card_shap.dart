import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/card_num_text_format.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CridetCardShap extends StatefulWidget {
  const CridetCardShap({super.key, required this.cardController, });

 
  final TextEditingController cardController;

  @override
  State<CridetCardShap> createState() => _CridetCardShapState();
}

class _CridetCardShapState extends State<CridetCardShap> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 245.h,
    width: 327.sw,
      child: Stack(children: [
         Positioned.fill(
            child: Image.asset(
              'assets/images/Rectangle.png',
              fit: BoxFit.fill,
            ),
          ),
        Image.asset('assets/images/Masks.png'),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:15,horizontal: 16),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(children: [
                Text('Credit Card',style: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.whiteColor,fontSize: 15),),
                Spacer(),
                Image.asset('assets/images/twocircels.png',height:48,width:48,),
              ],),
              SizedBox(height: 43,),
    SizedBox(width: 199.w,height: 23.h,
      child: TextField(  readOnly: true,
  enabled: false,
        controller: widget.cardController,
        keyboardType: TextInputType.number,
        inputFormatters: [
      CardNumberFormatter(),
      LengthLimitingTextInputFormatter(22),
    ],
        style: AppTextStyle.optionLabelStyle.copyWith(
      color: AppColors.whiteColor,
      fontSize: 16,
        ),
        
        decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 10),
      border: InputBorder.none,
      hintText: '0000 0000 0000 0000',
    
      hintStyle: TextStyle( 
        color: Colors.white,
      ),
        ),
      ),
    ),
               SizedBox(height:37.h,),
               Row(children: [
                Text('Brooklynsim',style: AppTextStyle.optionLabelStyle.copyWith(color: AppColors.whiteColor,fontSize: 15),),
                Spacer(),
                Text('06/21',style: AppTextStyle.optionLabelStyle.copyWith(color: AppColors.whiteColor,fontSize: 14),),
              ],),
            ],),
          ),
        )
      ],),
    );
  }
}