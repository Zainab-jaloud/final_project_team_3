import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/search/presentation/widget/search_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart'; 
import 'package:flutter_application/feature/set_location/data/location_service.dart'; 

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  
  LatLng _initialPosition = const LatLng(24.7136, 46.6753); 
  bool _isLoading = true;
  
 //متغير يحفظ الموقع ومهيأ بقيمة ابتدائية توحي بالتحميل ريثما يظهر الموقع الاساسي
  String _currentAddress = "Loading your location...";

  BitmapDescriptor? _customMarkerIcon;
  final Set<Marker> _markers = {}; 

//كائن من الخدمة
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _getUserLocation(); 
  }

  // دالة جلب الموقع وتحديث الواجهة
  Future<void> _getUserLocation() async {
    try {
      //  جلب الاحداثيات الحالية للمستخدم
      LatLng position = await _locationService.determineUserPosition();

      
      String addressName = await _locationService.getAddressFromLatLng(position);

      _customMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(40, 40)),
        'assets/images/location_pin.png', 
      );
      
      setState(() {
        _initialPosition = position;
        _isLoading = false;
        _currentAddress = addressName; //تمرير الموقع للبطاقة

        _markers.clear(); 
        _markers.add(
          Marker(
            markerId: const MarkerId('current_user_marker'),
            position: _initialPosition, 
            icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: addressName), // عرض الاسم فوق الدبوس
          ),
        );
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_initialPosition, 15.0),
      );

    } catch (error) {
      //التقاط الاخطاء وعرضها كما هي 
      setState(() {
        _isLoading = false;
        _currentAddress = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      appBar: CustomAppBar(
        title: '', 
        icon1: '', 
        icon2: '', 
        rightIcon1: false, 
        rightIcon2: false,
      ),
      body: Stack(
        children: [
          _isLoading 
              ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))   
              : Positioned.fill( 
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 15.0),
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                    myLocationEnabled: false, 
                    myLocationButtonEnabled: false, 
                    markers: _markers, 
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                  ),
                ),
    
          Positioned(
            top: 19.h,
            left: 24.w,
            right: 24.w,
            child: CustomSearchField(
              hintText: 'Search Location', 
              autofocus: false,
              onSubmitted: (value) {},
            ),
          ),
    
          Positioned(
            bottom: 24.h, 
            left: 24.w,
            right: 24.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Colors.grey.shade300, 
                        width: 1.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(23, 0, 0, 0),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Location Details',
                          style: AppTextStyle.optionValueStyle.copyWith(fontSize: 20)
                        ),
                        SizedBox(height: 14.h),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 28.r,
                              backgroundColor: AppColors.babyPurple, 
                              child: SvgPicture.asset("assets/icons/Location.svg",),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                _currentAddress, 
                                style: AppTextStyle.optionLabelStyle.copyWith(fontSize: 14),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 27.h,)
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 24.h), 
            
                AppButton(
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  shadow: false,
                  text: 'Choose Location', 
                  onPressed: () {},
                ),
                SizedBox(height: 38.h), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
