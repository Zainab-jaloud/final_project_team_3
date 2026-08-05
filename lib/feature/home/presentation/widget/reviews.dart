
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PersonsReviews extends StatefulWidget {
  const PersonsReviews({
    super.key, required this.name, required this.comment, required this.image,
  });
 final String name;
  
  final String comment;
  final String image;

  @override
  State<PersonsReviews> createState() => _PersonsReviewsState();
}
double _rating =4;
class _PersonsReviewsState extends State<PersonsReviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 278.w,
    height: 114.h,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
      color: AppColors.whiteColor,border:Border.all(color:AppColors.dotColor,width:1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
             radius:25,
              child: ClipRRect(borderRadius: BorderRadius.circular(40),child: Image.asset(widget.image)),
            ),
    
            const SizedBox(width: 12),
    
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Text(widget.name,style:AppTextStyle.optionValueStyle.copyWith(fontSize: 16)
        ),
                   Spacer(),  
         RatingBar.builder(
  initialRating: _rating,
  itemCount: 5,
   itemSize:12,
unratedColor:AppColors.emptyStar,

  itemBuilder: (context, _) => SvgPicture.asset(
    'assets/icons/Star.svg',
        // ignore: deprecated_member_use
        color:AppColors.starColor,
  ),
  onRatingUpdate: (rating) {
    setState(() {
      _rating = rating;
    });
  },
                  )]),
    
                   SizedBox(height: 8,),
    
                  Text(
                    widget.comment,
                    style:AppTextStyle.optionLabelStyle,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            )
          ],))
    
         );
  }
}
