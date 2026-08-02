import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PayProperty extends StatefulWidget {
  const PayProperty({
    super.key, required this.properties
  });

final PropertyModel properties;
  @override
  State<PayProperty> createState() => _PayProperty();
}

class _PayProperty extends State<PayProperty> {
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
          context.push('/details', extra: widget.properties);
      },
      child: Container(width: 327.sw,height: 99.h,
         padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),  
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(12),border:Border.all(
        color: AppColors.borderColor,
          //  width: 1,
         
       )),
       
       child: Row(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(6),
           child: Image.asset(
             widget.properties.image,
             width: 80,
             height:62,
             fit: BoxFit.scaleDown,
           ),
         ),SizedBox(width: 12,),
       Expanded(
         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [Row(
             children: [
               Expanded(
                 child: Text(widget.properties.name,style: 
                   AppTextStyle.optionValueStyle,  maxLines: 1,
                       overflow: TextOverflow.ellipsis,),
               ),
    
       
             ],
           ),SizedBox(height:2,),
         Row(spacing: 4,
           children: [SvgPicture.asset('assets/icons/Location2.svg',colorFilter: ColorFilter.mode(AppColors.locationColor,BlendMode.srcIn,),),
             SizedBox(width: 100,
               child: Text(widget.properties.location,
                overflow: TextOverflow.ellipsis,maxLines:1,
                style:
               AppTextStyle.optionLabelStyle.copyWith(fontSize: 10)),
             ),
           ],
         ),SizedBox(height: 4,),
         Row(
           children: [
            Text.rich(TextSpan(children: [TextSpan(text:widget.properties.price,style:
           AppTextStyle.optionValueStyle.copyWith(fontSize: 10)
        ),TextSpan(text:'/month',
            style: AppTextStyle.optionValueStyle.copyWith(fontSize: 10)
        )])
            ), 
        Spacer(),
             
           Padding(
             padding: const EdgeInsets.only(right:8),
             child: Container(width:35,height: 18, 
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:AppColors.ratingColor),
             child: Row(spacing: 2.25,
               mainAxisAlignment: MainAxisAlignment.center,children: [SvgPicture.asset('assets/icons/Star.svg'),
               Text('${widget.properties.rating}',style:
                AppTextStyle. heading1.copyWith(fontSize: 10))],),
             ),
           )
           ],
         )],),
       )
      ],),),
    );
  }
}
