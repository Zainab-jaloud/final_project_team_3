 
import 'package:flutter/material.dart'; 
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/presentation/widget/home_app_bar.dart';
import 'package:flutter_application/feature/home/presentation/widget/main_title.dart';
import 'package:flutter_application/feature/home/presentation/widget/near_places.dart';
import 'package:flutter_application/feature/home/presentation/widget/places_list.dart';
import 'package:flutter_application/feature/home/presentation/widget/search_field.dart';
import 'package:flutter_application/feature/home/presentation/widget/top_location_list.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 import 'package:shared_preferences/shared_preferences.dart';
 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.location, this.manualLocation,});
  final LatLng? location;
 final String? manualLocation;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String address = "";

  @override
  void initState() {
    super.initState();
    getAddress();
  }
  Future<LatLng?> loadLocation() async {
  final prefs = await SharedPreferences.getInstance();

  final lat = prefs.getDouble('latitude');
  final lng = prefs.getDouble('longitude');

  if (lat == null || lng == null) {
    return null;
  }

  return LatLng(lat, lng);
}
 Future<void> getAddress() async {
  final prefs = await SharedPreferences.getInstance();

  final type = prefs.getString('locationType');

  // إذا آخر اختيار كان يدوي
  if (type == 'manual') {
    setState(() {
      address = prefs.getString('manualLocation') ?? '';
    });
    return;
  }

  // إذا آخر اختيار كان من الخريطة
  if (type == 'map') {
    LatLng? location = await loadLocation();

    if (location == null) return;

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      Placemark place = placemarks.first;

      setState(() {
        address = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24),
        child: Column(
          children: [
 
            HomeAppBar(address:address,),
 SizedBox(height: 32,),
 SearchField(),
 SizedBox(height: 22,),
 Image.asset(AppImages.panal),
 SizedBox(height: 24,),
 MainTitles(title: 'Recomended', onTap: () {},),
  SizedBox(height: 16,),
  SizedBox(height: 164,
    child: PlacesList(),
  ),
  SizedBox(height: 24,),
MainTitles(title:'Nearby', onTap: (){}),
SizedBox(height: 16,),
 SizedBox(width: 496,height: 160,
   child: GridView.count(crossAxisCount:2,scrollDirection: Axis.horizontal,mainAxisExtent:240,
   mainAxisSpacing: 28,crossAxisSpacing: 12,
   children: [
    NearPlaces(isPopular: false, properties: properties[1], onChange: () {},),
    NearPlaces(isPopular: false, properties: properties[3], onChange: () {  },),
    NearPlaces(isPopular: false, properties:  properties[4], onChange: () {  },),
    NearPlaces(isPopular: false, properties:  properties[5], onChange: () {  },),
    
 ],),
 ),
 SizedBox(height: 22,),
 
 MainTitles(title: 'Top Locations', onTap: () {},),
 SizedBox(height: 16,),
  TopLocations(),
SizedBox(height: 24,),
MainTitles(title:'Popular for you', onTap:(){(context).push('/popular');}),
 SizedBox(height: 16,),
  ListView.separated(shrinkWrap: true,
  physics:NeverScrollableScrollPhysics(),itemBuilder: (context, index) => 
  NearPlaces(isPopular: true, properties: properties[index], onChange: () {  },),itemCount:4,
  separatorBuilder: (BuildContext context, int index) {  return const SizedBox(height: 8);},),




 ],)
          
        ),
      )),
    );
  }
}



 