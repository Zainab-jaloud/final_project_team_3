import 'package:flutter/material.dart';
 import 'package:flutter_application/feature/home/presentation/widget/top_location.dart';

class TopLocations extends StatefulWidget {
 const   TopLocations({
    super.key,
  });

  @override
  State<TopLocations> createState() => _TopLocationsState();
}

class _TopLocationsState extends State<TopLocations> {
  int selectedIndex = 0; 
   @override
  Widget build(BuildContext context) {
    return SizedBox(height:46,
      child: ListView.custom(scrollDirection: Axis.horizontal,
          childrenDelegate: SliverChildListDelegate([
    TopLocation(
  address: 'Malang',
  isSelected: selectedIndex == 0?true:false,
  onTap: () {
    setState(() {
      selectedIndex = 0;
    });
  },
),SizedBox(width: 12,),
      TopLocation(address: 'Bali', isSelected: selectedIndex == 1?true:false, onTap: () {
        setState(() {
      selectedIndex = 1;
    }); },) ,SizedBox(width: 12,),
      TopLocation(address: 'Yogyakarta', isSelected: selectedIndex == 2?true:false,onTap: () { 
        setState(() {
      selectedIndex = 2;
    });  },) ,SizedBox(width: 12,),
      TopLocation(address: 'Jakarta', isSelected: selectedIndex == 3?true:false,onTap: () { 
        setState(() {
      selectedIndex = 3;
    });},) ,SizedBox(width: 12,),
      TopLocation(address: 'Malang', isSelected: selectedIndex == 4?true:false,onTap: () {
         setState(() {
      selectedIndex = 4;
    });  },) ,SizedBox(width: 12,),
      
          ])),
    );
  }
}

