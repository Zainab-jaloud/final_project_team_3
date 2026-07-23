import 'package:flutter_application/feature/home/screens/home_screen.dart';
import 'package:flutter_application/feature/auth/presentation/screens/log_in.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/maps.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/set_location_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute { static final GoRouter pageRoute = GoRouter(
 routes: [
      //  GoRoute(
      //   path: '/',
      //   builder: (context, state) => const LoginScreen(),
      // ),

      //  GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SetLocationScreen(),
      // ),

            GoRoute(
        path: '/',
        builder: (context, state) => const MapScreen(),
      ),




     GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),

            GoRoute(
        path: '/maps',
        builder: (context, state) => const MapScreen(),
      ), 
      
      
      ]);

}