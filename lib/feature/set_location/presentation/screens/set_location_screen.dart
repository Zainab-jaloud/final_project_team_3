import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/set_location/presentation/widget/select_location_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(actions: [ Padding(padding:EdgeInsetsGeometry.symmetric(vertical: 7,horizontal:16 ),
      child: ElevatedButton(onPressed:(){context.go('/home');},style:ElevatedButton.styleFrom(backgroundColor:Colors.transparent,elevation: 0,  
       padding: EdgeInsets.zero, shadowColor: Colors.transparent,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),side: BorderSide(
        color:AppColors. dotColor ,width: 1)) ),
       child:Text("Skip",style:AppTextStyle.optionLabelStyle.copyWith(color:Color(0XFF4D5761) ),)),)],) ,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(height: 122.h,),
                      Image.asset("assets/images/select_location.png"),
                       SizedBox(height: 46.h,),
                       Text('Hi, Nice to meet you !',style: AppTextStyle.topCaption,),
                       Text('Choose your location to fint property arround you.',style:AppTextStyle.locationTextStyl,),
                       SizedBox(height: 104.h,),
                       AppButton(text: "Use current location", onPressed: (){context.push('/maps');}),
                       SizedBox(height: 16.h,),
 
                       SelectLocationButton(text:"Select it manually" ,onPressed: () async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('locationType', 'manual');

  await prefs.setString(
    'manualLocation',
    'Yogyakarta, Ind',
  );

  // نمسح إحداثيات الخريطة
  await prefs.remove('latitude');
  await prefs.remove('longitude');

  context.go('/home');
},),
 
                       SizedBox(height: 48.h,)
          
          
                  ],
          ),
        ),
        
      ),
    );
  }
}