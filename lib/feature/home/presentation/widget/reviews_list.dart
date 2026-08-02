import 'package:flutter/material.dart';
import 'package:flutter_application/feature/home/presentation/screens/details_screen.dart';
import 'package:flutter_application/feature/home/presentation/widget/reviews.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
    required this.widget,
  });

  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width:500,height: 104,
    child:ListView.separated(scrollDirection: Axis.horizontal,
    shrinkWrap: true,
     itemBuilder: (context,int index){return PersonsReviews(name:widget.reviews[index]['name'],
     comment:widget.reviews[index]['comment'], image:widget.reviews[index]['image'],);
     }, 
    separatorBuilder:(context,int index){return SizedBox(width: 12,);},
     itemCount:2),);
  }
}
