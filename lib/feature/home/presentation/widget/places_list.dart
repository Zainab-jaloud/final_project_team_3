import 'package:flutter/material.dart';
import 'package:flutter_application/feature/home/presentation/widget/place_card.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.custom(scrollDirection: Axis.horizontal,
      childrenDelegate: SliverChildListDelegate([
     PlaceCard(),SizedBox(width: 16,),
     PlaceCard(),SizedBox(width: 16,),
     PlaceCard(),SizedBox(width: 16,),
     PlaceCard(),SizedBox(width: 16,),
     PlaceCard(),SizedBox(width: 16,),
     PlaceCard(),SizedBox(width: 16,),
      
    
    ]),);
  }
}
