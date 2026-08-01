import 'package:flutter_application/feature/home/screens/home_screen.dart';
import 'package:flutter_application/feature/messages/presentation/screens/messages_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/create_new_password_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/reset_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/success_reset_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/verify_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter pageRoute = GoRouter(
    initialLocation: '/messages',
    // initialLocation: '/reset-password',
    routes: [
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
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
      GoRoute(
        path: '/messages',
        builder: (context, state) => const MessagesScreen(),
      ),
    ],
  );
}
