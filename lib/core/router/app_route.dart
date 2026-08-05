import 'package:flutter_application/feature/booking_activity/presentation/screens/booking_screen.dart';
import 'package:flutter_application/feature/booking_payement/presentation/screens/add_card.dart';
import 'package:flutter_application/feature/booking_payement/presentation/screens/booking_pay_screen.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/data/reviews_model.dart';
import 'package:flutter_application/feature/home/presentation/screens/all_reviews_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/details_screen.dart';
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
   GoRoute(
            path: '/mybooking',
            builder: (context, state){
           
          return MyBooking(status: 'completed',
      // startDate:DateTime(19,7),
      // endDate:DateTime(22,7)
      
      );} ), 
           
        ],
      ),
     GoRoute(
            path: '/details',
              builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;

    final property = data['property'] as PropertyModel;
    final reviews = data['reviews'] as List<ReviewsModel>;
                return DetailsScreen(property:property, reviews:reviews,);
 } ),  
     GoRoute(
            path: '/booking&payout',
            builder: (context, state) {
   final data = state.extra as Map<String, dynamic>;
    return BookingPayOutScreen(
       property: data['property'] as PropertyModel,
     cardNumber: data['cardNumber'] as String?,
    );
  }, ),  
     GoRoute(
            path: '/addCard',
            builder: (context, state){   final data = state.extra as Map<String, dynamic>;
          return AddCard( property: data['property'] as PropertyModel,
          startDate: data['startDate'],
      endDate: data['endDate'],
          );} ),  
   GoRoute(
  path: '/allReviews',
  builder: (context, state) {
    final reviews = state.extra as List<ReviewsModel>;

    return AllReviewsScreen(
      reviews: reviews,
    );
  },
),
    ],
  );
}
    
      
         
 