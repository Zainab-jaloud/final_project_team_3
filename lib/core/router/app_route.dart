import 'package:flutter_application/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';
class AppRoute { static final GoRouter pageRoute = GoRouter( initialLocation: '/nav',
 
 routes: [
     GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      
     GoRoute(
        path: '/nav',
        builder: (context, state) => const MainScreen(),
      )
      
      
      
      ]);

}