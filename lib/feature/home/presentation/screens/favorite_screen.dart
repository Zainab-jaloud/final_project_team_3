import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/home/presentation/widget/favorite_places.dart';
import 'package:go_router/go_router.dart';
 
 

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      appBar: CustomAppBar(title:'Favorite', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false, onPageChanged: () {(context).push('/home');},),
 
         body: SingleChildScrollView(
        child: Padding(padding:EdgeInsets.all(24),
        child:Column(
          children: [
            FavoritePlaces(),
          ],
        ),),
      ),
    );
  }
}
