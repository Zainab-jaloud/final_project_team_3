import 'package:flutter_application/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter_application/feature/auth/presentation/screens/log_in.dart';
import 'package:flutter_application/feature/search/presentation/screens/fillter_bottom_sheet.dart';
import 'package:flutter_application/feature/search/presentation/screens/filter_results_page.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/maps.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/set_location_screen.dart';
import 'package:flutter_application/feature/search/presentation/screens/filter_results_page.dart';
import 'package:flutter_application/feature/search/data/filter_selection_model.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application/feature/search/presentation/screens/search.dart';
import 'package:flutter_application/feature/search/presentation/screens/fillter_bottom_sheet.dart';
class AppRoute { static final GoRouter pageRoute = GoRouter(
 routes: [
      //  GoRoute(
      //   path: '/',
      //   builder: (context, state) => const LoginScreen(),
      // ),

      //  GoRoute(
      //   path: '/',
      //   builder: (context, state) => const FilterBottomSheet(),
      // ),

      //       GoRoute(
      //   path: '/',
      //   builder: (context, state) => const MapScreen(),
      // ),
     GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),



     GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),

       GoRoute(
        path: '/setlocation',
        builder: (context, state) => const SetLocationScreen(),
      ),




            GoRoute(
        path: '/maps',
        builder: (context, state) => const MapScreen(),
      ), 
      

            GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),

            GoRoute(
        path: '/filterResults',
        builder: (context, state) { final selectionModel = state.extra as FilterSelectionModel;
        return FilterResultsPage(selection: selectionModel);},
      ),

      
      ]);

}