import 'package:flutter_application/feature/home/presentation/screens/favorite_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/main_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/popular_places.dart';
import 'package:go_router/go_router.dart';
class AppRoute { static final GoRouter pageRoute = GoRouter( initialLocation: '/home',
  routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/popular',
            builder: (context, state) => const PopularPlaces(),
          ),
          GoRoute(
            path: '/favorite',
            builder: (context, state) => const FavoriteScreen(),
          ),

           
        ],
      ),
    ],
  );
}
    
      
         
 