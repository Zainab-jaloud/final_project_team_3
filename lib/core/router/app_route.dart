import 'package:flutter_application/feature/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_application/feature/splash/presentation/screens/splash_screen.dart';

class AppRoute {
  static final GoRouter pageRoute = GoRouter(
    initialLocation: '/splash',
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
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    ],
  );
}
