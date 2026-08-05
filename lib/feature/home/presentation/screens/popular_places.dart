import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/presentation/widget/near_places.dart';
import 'package:go_router/go_router.dart';
 

class PopularPlaces extends StatefulWidget {
  const PopularPlaces({super.key});

  @override
  State<PopularPlaces> createState() => _PopularPlacesState();
}

class _PopularPlacesState extends State<PopularPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Popular', icon1:'', icon2: '', rightIcon1:false, rightIcon2:false, onPageChanged: () { context.pop(); },),
      body: SingleChildScrollView(
        child: Padding(padding:EdgeInsets.all(24),
        child:Column(
          children: [
            ListView.separated(itemCount:properties.length,shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              itemBuilder:(BuildContext,index){return NearPlaces(isPopular:true, properties:properties[index], onChange: () {
                setState(() {
                
              }); },);}, 
              separatorBuilder: (BuildContext context, int index) { return SizedBox(height:15); },),
          ],
        ),),
      ),
    );
  }
}

