import 'package:flutter/material.dart';
import 'package:flutter_application/feature/home/presentation/widget/fasilities.dart';

class PublicFasilities extends StatelessWidget {
  const PublicFasilities({
    super.key,
    required this.fasilities,
  });

  final Map<String, String> fasilities;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 367,
      child: ListView.separated( 
        scrollDirection: Axis.horizontal,
        itemCount: fasilities.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          return Fasilities(
    icon: fasilities.values.elementAt(index),
    name: fasilities.keys.elementAt(index),
          );
        },
      ),
    );
  }
}