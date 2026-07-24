import 'package:flutter_application/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter_application/feature/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter_application/feature/profile/presentation/screens/edit_profile_screen.dart';
import 'package:flutter_application/feature/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_application/feature/auth/presentation/screens/log_in.dart';
import 'package:flutter_application/feature/set_location/data/model.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/maps.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/set_location_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/create_new_password_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/reset_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/success_reset_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/verify_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/presentation/screens/details_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/favorite_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/main_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/popular_places.dart';
 
class AppRoute {
  static final GoRouter pageRoute = GoRouter(
    initialLocation: '/splash',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
           builder: (context, state) {
    final result = state.extra as LocationResult?;

    return HomeScreen(
       location: result?.location,
  manualLocation: result?.text,
    );
  },
          ),
          GoRoute(
            path: '/popular',
            builder: (context, state) => const PopularPlaces(),
          ),
          GoRoute(
            path: '/favorite',
            builder: (context, state) => const FavoriteScreen(),
          ),
              GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),],
      ),
 
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
        GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
       GoRoute(
        path: '/maps',
        builder: (context, state) => const MapScreen(),
      ), 
 GoRoute(
        path: '/setlocation',
        builder: (context, state) => const SetLocationScreen(),
      ),

        GoRoute(
            path: '/details',
            builder: (context, state) {
              final property = state.extra as PropertyModel;
                return DetailsScreen(property:property);
 } ), 
  GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/reset-password',
        builder: (context, state) => const ResetScreen(),
      ),
      GoRoute(
        path: '/verify-email',
        builder: (context, state) => const VerifyScreen(),
      ),
      GoRoute(
        path: '/create-new-password',
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: '/success-reset',
        builder: (context, state) => const SuccessResetScreen(),
      ), 
    ],
  );
}
 

 
      
   
    
      
         
 