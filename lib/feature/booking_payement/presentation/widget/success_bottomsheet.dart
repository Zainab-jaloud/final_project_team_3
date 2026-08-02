import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyBottomSheet extends StatelessWidget {
    MyBottomSheet({super.key, required this.image,
     required this.title, required this.text, required this.withButton,this.buttonText,this.onPressed});
final String image;
final String title;
final Widget text;
final bool withButton;
 String ?buttonText;
VoidCallback ?onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:3),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
            children: [
                 Container(
            width: 43,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height:68),
              Image.asset(image,width: 208.w,height: 208.w,),
            const SizedBox(height: 48,),
            Text(title,style:AppTextStyle.optionValueStyle.copyWith(fontSize: 20),),
            SizedBox(height: 16,),
            text,
            SizedBox(height: 48,),
          withButton?
          AppButton(text:buttonText??'', onPressed: onPressed):SizedBox()
          ]),
        ),
      ),
    );
  }
}