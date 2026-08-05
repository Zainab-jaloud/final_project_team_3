import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/services/favorite_manager.dart';
import 'package:flutter_application/core/services/review_manager.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NearPlaces extends StatefulWidget {
  const NearPlaces({
    super.key, required this.isPopular, required this.properties, required this.onChange,
  });
final bool isPopular;
final PropertyModel properties;
final VoidCallback onChange;
  @override
  State<NearPlaces> createState() => _NearPlacesState();
}

class _NearPlacesState extends State<NearPlaces> {
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
          context.go('/details',extra: {
    'property': widget.properties,
    'reviews': ReviewsManager.reviews,
  },)
;
      },
      child: Container( padding: const EdgeInsets.only(bottom:16),  
        decoration: BoxDecoration( border:   Border(
         bottom: BorderSide(
           color: AppColors.borderColor,
           width: 1,
         ),
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
         widget.isPopular?Transform.translate(
        offset: const Offset(-7, 0),  
        child: InkWell(onTap: () {
      setState(() {
        FavoriteManager.toggle(widget.properties);
        widget.onChange();
      });},
      child:  FavoriteManager.isFavorite(widget.properties)
          ? 
      SvgPicture.asset(
        'assets/icons/Heart_red.svg',
        width: 19,
        height: 18,): SvgPicture.asset(
        'assets/icons/Heart.svg',
        width: 19,
        height: 18,
        colorFilter: ColorFilter.mode(AppColors.redHeartColor,BlendMode.srcIn),
        ),
        ),
      ):SizedBox(),
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
        ),TextSpan(text:'/night',
            style: AppTextStyle.optionValueStyle.copyWith(fontSize: 10)
        )])
            ), 
        Spacer(),
             
           Padding(
             padding: const EdgeInsets.only(right:8),
             child: Container(width:38,height:20, 
              // margin: EdgeInsets.all(),
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:AppColors.ratingColor),
 
             child: Row(spacing: 2.25,
 
               mainAxisAlignment: MainAxisAlignment.center,children: [SvgPicture.asset('assets/icons/Star.svg'),
               Text('${widget.properties.rating}',style:
                AppTextStyle. heading1.copyWith(fontSize: 11))],),
             ),
           )
           ],
         )],),
       )
      ],),),
    );
  }
}
