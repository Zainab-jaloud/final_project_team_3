import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';

// ignore: must_be_immutable
class PropertyDetails extends StatelessWidget {
   PropertyDetails({super.key, required this.title, required this.number, this.icon});
final String title;
final String number;
 Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: 
          AppTextStyle.optionLabelStyle),
        Row(spacing:2,
          children: [icon??Text(''),Text(number,style: 
          AppTextStyle.optionValueStyle.copyWith(fontSize: 12)
        )],)
      ],
    );
  }
}