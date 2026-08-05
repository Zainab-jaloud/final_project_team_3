import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/services/favorite_manager.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({
    super.key, required this.recomended,
  });
final PropertyModel recomended;

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    context.go('/details', extra: widget.recomended);
  },
      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),height: 164,width: 224,child:
      
       Stack(
       children: [Positioned.fill(
         child: ClipRRect(borderRadius: BorderRadius.circular(16),
           child: Image.asset(widget.recomended.image,
           fit: BoxFit.fitWidth,),
         ),
       ),
       Container(
       width: 224,
       height: 164,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(16),
         gradient: LinearGradient(
           begin: Alignment.centerLeft,
           end: Alignment.bottomLeft,
           colors: [
             Color.fromRGBO(0,0,0,0),
           Color.fromRGBO(0,0,0,0.7),
           ],
         ),
       ),
          ),
       Positioned(top:83,
         
         child:Padding(
           padding: const EdgeInsets.all(16),
           child:  
             Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               SizedBox(width: 168,
                 child: Text(widget.recomended.name,overflow: TextOverflow.ellipsis,maxLines: 1,
                 style:AppTextStyle.optionValueStyle.copyWith(color: AppColors.whiteColor)),
               ),
               Row(
                 children: [SvgPicture.asset('assets/icons/Location2.svg'),
                 SizedBox(width: 7,),
                   SizedBox(width: 120,
                     child: Text(widget.recomended.location,
                      maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     style: AppTextStyle.optionLabelStyle.copyWith(color: AppColors.dotColor)
                     ),
                   ),
                 
               
             ],),
                     
                       
             
                      ],
                 ),
         )),Positioned(top:108,right: 16,
              child: Container(width: 24,height: 24,
              decoration:BoxDecoration(color:AppColors.whiteColor,borderRadius: BorderRadius.circular(27)),
                 child:Center(child:
                 
                 InkWell(onTap: () {
      setState(() {
        FavoriteManager.toggle(widget.recomended);
      });},
      child:  FavoriteManager.isFavorite(widget.recomended)
          ? 
      SvgPicture.asset(
        'assets/icons/Heart_red.svg',
         ): SvgPicture.asset(
        'assets/icons/Heart.svg',width: 12,height: 15,
        colorFilter: ColorFilter.mode(AppColors.redHeartColor,BlendMode.srcIn),
        ),
        ),)),
            ),
         Positioned(top: 16,right: 16,
           child:Container(  padding: EdgeInsets.symmetric(horizontal: 12, vertical:6),
          alignment: Alignment.center,decoration: BoxDecoration(color:AppColors.whiteColor,borderRadius: BorderRadius.circular(8)),
            child:  Text.rich(TextSpan(children: [TextSpan(text:widget.recomended.price,style: 
           AppTextStyle.optionLabelStyle.copyWith(fontSize: 12,color: AppColors.secondaryColor)),
            TextSpan(text:'/month',
            style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 10))])
            ),
         ))
         
         
         
         ],
      ),
      
      
      
      
      
      
      ),
    );
  }
}