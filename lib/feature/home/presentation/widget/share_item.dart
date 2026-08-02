import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';
 

class ShareItem extends StatelessWidget {
  final String  icon;
 
  final String title;

  const ShareItem({
    super.key,
    required this.icon,
    
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          
          child:Image.asset(icon)
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyle.optionValueStyle.copyWith(fontSize: 12)
        
        ),
      ],
    );
  }
}