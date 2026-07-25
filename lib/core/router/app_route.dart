import 'package:flutter_application/feature/home/screens/home_screen.dart';
import 'package:flutter_application/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_application/feature/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_application/feature/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter pageRoute = GoRouter(
    // TODO: رجّعيها '/splash' بعد ما تخلصي تجربي صفحة البروفايل
    initialLocation: '/profile',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      // TODO(leader):
      // GoRoute(
      //   path: '/login',
      //   builder: (context, state) => const LoginScreen(),
      // ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      // TODO: فكيها بعد ما نبني صفحة Edit Profile
      // GoRoute(
      //   path: '/edit-profile',
      //   builder: (context, state) => const EditProfileScreen(),
      // ),
    ],
  );
}