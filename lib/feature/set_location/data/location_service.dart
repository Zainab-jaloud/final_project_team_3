import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart'; 

class LocationService {
  
  // الدالة الاساسية لتحديد موقع المستخدم 
  Future<LatLng> determineUserPosition() async {
    await _checkLocationService();
    await _checkAndRequestPermissions();

    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  // التحقق من خدمات الموقع في الهاتف
  Future<void> _checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("error with location services.Try enable it");
    }
  }

  // فحص وطلب الصلاحيات من المستخدم
  Future<void> _checkAndRequestPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("location permession denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("location permession always denied.check settings");
    }
  }

  //تحويل خطوط الطول والعرض الى اسم 

  Future<String> getAddressFromLatLng(LatLng position) async {
    try {
   
      await setLocaleIdentifier("en"); //تحديد لغة العرض

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, 
        position.longitude,
  
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first; 
        return "${place.street ?? ""}, ${place.subLocality ?? ""}, ${place.locality ?? ""}";
      }
      return "Unknown Location";
    } catch (e) {
      return "Could not fetch address name";
    }
  }

}
