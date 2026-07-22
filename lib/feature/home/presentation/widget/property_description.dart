import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:readmore/readmore.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 16,
      children: [Text('Description',style: 
AppTextStyle.titleTextStyl),SizedBox(width: 327,
       child: ReadMoreText(
         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s, when an unknown printer took when an unknown printer took a type Read more1233123442',
         trimLines: 3,
         trimMode: TrimMode.Line,
         trimCollapsedText: ' Read more',
         trimExpandedText: ' Read less',
         style:  AppTextStyle.locationTextStyl.copyWith(fontSize: 12),
         moreStyle: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.secondaryColor),
         lessStyle: AppTextStyle.fasilitiesTextStyl.copyWith(color: AppColors.secondaryColor)
       ),
     )
           ] );
  }
}

