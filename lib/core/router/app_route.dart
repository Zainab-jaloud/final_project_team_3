import 'package:flutter_application/feature/add_review/presentation/screens/write_review_screen.dart';
import 'package:flutter_application/feature/notifications/presentation/screens/notifications_screen.dart';
import 'package:flutter_application/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_application/feature/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter_application/feature/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_application/feature/profile/presentation/screens/edit_profile_screen.dart';
 
 import 'package:go_router/go_router.dart'; 
class AppRoute {
  static final GoRouter pageRoute = GoRouter(

    initialLocation: '/splash',

   


    
   

    routes: [
 
        
              GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ) ,

      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      
      
     
  GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
    
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/write-review',
        builder: (context, state) => const WriteReviewScreen(),
      ),
    ],
  );
}