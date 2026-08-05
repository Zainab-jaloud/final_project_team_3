import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/home/data/reviews_model.dart';
import 'package:flutter_application/feature/home/presentation/widget/reviews.dart';
import 'package:go_router/go_router.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key, required this.reviews});

  final List<ReviewsModel> reviews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:'All Reviews', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false,
       onPageChanged:(){context.pop();}),
        body: SingleChildScrollView(
        child: Padding(padding:EdgeInsets.all(24),
        child:Column(
          children: [
            ListView.separated(itemCount:reviews.length,shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              itemBuilder:(BuildContext,index){return  PersonsReviews(name:reviews[index].name, comment:reviews[index].description,
               image:reviews[index].photo);
                 }, 
              separatorBuilder: (BuildContext context, int index) { return SizedBox(height:15); },),
          ],
        ),),
      ),
    );
  }
}