import 'package:flutter/material.dart';
import 'package:flutter_application/feature/home/data/reviews_model.dart';
import 'package:flutter_application/feature/home/presentation/screens/details_screen.dart';
import 'package:flutter_application/feature/home/presentation/widget/reviews.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
    required this.widget, required this.reviews,
  });

  final List<ReviewsModel> reviews;
  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width:500,height: 104,
    child:ListView.separated(scrollDirection: Axis.horizontal,
    shrinkWrap: true,
     itemBuilder: (context,int index){return PersonsReviews(name:reviews[index].name,
     comment: reviews[index].description, image:reviews[index].photo,);
     }, 
    separatorBuilder:(context,int index){return SizedBox(width: 12,);},
     itemCount:2),);
  }
}
