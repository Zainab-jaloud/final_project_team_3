
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/services/favorite_manager.dart';
import 'package:flutter_application/feature/home/presentation/widget/near_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePlaces extends StatelessWidget {
  const FavoritePlaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if(FavoriteManager.favorites.isEmpty){
      return SizedBox(height:0.7.sh,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              
            children: [
            Icon(Icons.heart_broken_outlined,size:90,),
            SizedBox(height: 20,),
            Text('No Favorites yet',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily:'Inter',
            color: AppColors.titleColor),)
          ],),
        ),
      );}
    return ListView.separated(itemCount:FavoriteManager.favorites.length,shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      itemBuilder:(BuildContext,index){
           final property = FavoriteManager.favorites[index];
        return NearPlaces(isPopular:true, properties:property);}, 
      separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 8,); },);
  }
}