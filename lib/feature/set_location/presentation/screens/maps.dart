import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/widget/app_button.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
 
  GoogleMapController? _mapController;
  
  // إحداثيات افتراضية
  LatLng _initialPosition = const LatLng(24.7136, 46.6753); 
  bool _isLoading = true;

 
  BitmapDescriptor? _customMarkerIcon;
  final Set<Marker> _markers = {}; 

  @override
  void initState() {
    super.initState();
    _determineUserPosition(); 
  }

 
  Future<void> _determineUserPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

   
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _isLoading = false);
      return;
    }

    
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _isLoading = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() => _isLoading = false);
      return;
    }

    
    Position position = await Geolocator.getCurrentPosition();

    
    _customMarkerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(40, 40)),
      'assets/images/location_pin.png', 
    );
    
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _isLoading = false;

     
      _markers.clear(); 
      _markers.add(
        Marker(
          markerId: const MarkerId('current_user_marker'),
          position: _initialPosition, 
          icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
          infoWindow: const InfoWindow(title: 'your current location'),
        ),
      );
    });

  
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(_initialPosition, 15.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed:(context).pop, icon:Icon(Icons.arrow_back_outlined),), backgroundColor: Colors.transparent, elevation: 0, ),
    
      body:
           Stack(
              children: [
           _isLoading ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))   
              :  GoogleMap(
                  initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 15.0),
                  myLocationEnabled: false, 
                  myLocationButtonEnabled: false, 
                  markers: _markers, 
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                ),
    
               
                Positioned(
                  top: 32.h,
                  left: 24.w,
                  right: 24.w,
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),

                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(91, 0, 0, 0),
                          blurRadius: 10,
                          // offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Location',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        prefixIcon: Padding(padding:EdgeInsetsGeometry.all(10) ,child: SvgPicture.asset("assets/icons/Search.svg")) ,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                         borderSide: BorderSide(
                      color: Colors.grey, 
                        width: 1.0,    
                          ),
                         ), 

                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      ),
                    ),
                  ),
                ),
    
               
                Positioned(
                  bottom: 24.h,
                  left: 24.w,
                  right: 24.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Colors.grey.shade300, 
                            width: 1.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                            Text(
                              'Location Details',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 14.h),
                            
                            
                            Row(
                              children: [
                          
                                CircleAvatar(
                                  radius: 22.r,
                                  backgroundColor: Color.fromARGB(100, 137, 97, 222), 
                                    child: SvgPicture.asset("assets/icons/Location.svg"),
                                ),
                                SizedBox(width: 12.w),
                                
                               
                                Expanded(
                                  child: Text(
                                    'JI. Jend. Sudirman, Gowongan, Kec.Jetis, Kota Yogyakarta', 
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14.sp,            
                                      fontWeight: FontWeight.w400, 
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      SizedBox(height: 24.h),
                  
                      AppButton(
                        text: 'Choose Location', 
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }



}
