import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:go_router/go_router.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(actions: [ Padding(padding:EdgeInsetsGeometry.symmetric(vertical: 7,horizontal:24 ),
      child: ElevatedButton(onPressed:(){context.go('/home');},style:ElevatedButton.styleFrom(backgroundColor:Colors.transparent,elevation: 0,  
       padding: EdgeInsets.zero, shadowColor: Colors.transparent,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),side: BorderSide(color:AppColors.dotColor ,width: 1)) ),
       child:Text("Skip",style:AppTextStyle.optionLabelStyle.copyWith(color:Color(0XFF4D5761),fontSize: 11 ),)),)],) ,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(height: 73.h,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Image.asset("assets/images/select_location.png",),//width: 300.w,height: 215.h,
                      ),
                       SizedBox(height: 46.h,),
                       Text('Hi, Nice to meet you !',style: AppTextStyle.optionValueStyle.copyWith(fontSize: 20),),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
                         child: Center(child: Text('Choose your location to find property\naround you',textAlign: TextAlign.center,style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14),)),
                       ),
                       SizedBox(height: 95.h,),
                       AppButton(textColor:AppColors.whiteColor ,backgroundColor:AppColors.primaryColor,shadow: false ,text: "Use current location", onPressed: (){context.push('/maps');}),
                       SizedBox(height: 16.h,),
                       AppButton(textColor:AppColors.primaryColor ,backgroundColor:AppColors.whiteColor,shadow: true ,text:"Select it manually" , onPressed:(){ context.go('/home');}),
                       SizedBox(height: 48.h,)
          
          
                  ],
          ),
        ),
      ),
    );
  }
}