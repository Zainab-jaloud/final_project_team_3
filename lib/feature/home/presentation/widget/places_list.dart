import 'package:flutter/material.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/presentation/widget/place_card.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
  scrollDirection: Axis.horizontal,
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: PlaceCard(
          recomended: recomended[index],
        ),
      );
    },
    childCount:2,
  ),
);
  }
}
