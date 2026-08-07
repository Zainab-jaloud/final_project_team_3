import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';

class CvvTextField extends StatelessWidget {
  const CvvTextField({
    super.key, required this.label, required this.text,
  });
final String label;
final String text;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(label,style:AppTextStyle.heading1.copyWith(fontSize: 14) ),
      SizedBox(height: 4,),
        SizedBox(width: 155,height: 52,
          child: TextFormField(
            initialValue: text,
            readOnly: true,
            decoration:InputDecoration(
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color:AppColors.dotColor,width: 1)),
              // labelText: 'Expired',
              // labelStyle:AppTextStyle.optionLabelStyle.copyWith(color: AppColors.titleColor)
            ),
          ),
        ),
      ],
    );
  }
}