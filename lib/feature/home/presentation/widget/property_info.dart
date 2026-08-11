import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/home/presentation/screens/details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(width:243.w,
            child: Text(maxLines: 1,overflow: TextOverflow.ellipsis,
              widget.property.name,style: AppTextStyle.optionValueStyle.copyWith(fontSize:20)
                    ),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:0),
            child: Text.rich(TextSpan(children: [TextSpan(text:widget.property.price,style:AppTextStyle.optionValueStyle1.copyWith(fontSize: 14,color: AppColors.secondaryColor) 
                     ),TextSpan(text:'/month',
                  style:AppTextStyle.optionLabelStyle)])),
          ),
        ],
      ),Row(
      children: [SvgPicture.asset('assets/icons/Location2.svg',width: 15,height: 18,
      colorFilter: ColorFilter.mode(AppColors.locationColor,BlendMode.srcIn),),
      SizedBox(width: 4,),
        Expanded(
          child: SizedBox(width: 327.sw,
                
            child: Text(widget.property.location,style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 14)
          ,maxLines:1,overflow: TextOverflow.ellipsis,),
          ),
        ),
      ],
    )]);
  }
}
