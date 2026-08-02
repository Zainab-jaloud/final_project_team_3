import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:readmore/readmore.dart';
 

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({
    super.key, required this.property,
  });
final PropertyModel property;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 16,
      children: [Text('Description',style: 
AppTextStyle.optionValueStyle.copyWith(fontSize: 16)
        ),SizedBox(width: 327,
       child: ReadMoreText(
        property.description,
         trimLines: 3,
         trimMode: TrimMode.Line,
         trimCollapsedText: ' Read more',
         trimExpandedText: ' Read less',
         style:  AppTextStyle.optionLabelStyle,
         moreStyle: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.secondaryColor),
         lessStyle: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.secondaryColor)
       ),
     )
           ] );
  }
}

