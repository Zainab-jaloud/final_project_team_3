import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/home/presentation/screens/details_screen.dart';
import 'package:flutter_svg/svg.dart';

class PropertyInformation extends StatelessWidget {
  const PropertyInformation({
    super.key,
    required this.widget,
  });

  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 6,
      children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.property.name,style: AppTextStyle.titleTextStyl.copyWith(fontSize:20)),
          Text.rich(TextSpan(children: [TextSpan(text:widget.property.price,style:AppTextStyle.priceTextStyl 
         ),TextSpan(text:'/month',
                style:AppTextStyle.locationTextStyl.copyWith(fontSize: 12))])),
        ],
      ),Row(
      children: [SvgPicture.asset('assets/icons/Location2.svg',width: 15,height: 18,
      colorFilter: ColorFilter.mode(AppColors.locationColor,BlendMode.srcIn),),
      SizedBox(width: 4,),
        SizedBox(width: 327,
      
          child: Text(widget.property.location,style:AppTextStyle.locationTextStyl
        ,maxLines: 3,),
        ),
      ],
    )]);
  }
}
