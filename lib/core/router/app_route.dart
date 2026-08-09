 
import 'package:flutter_application/feature/add_review/presentation/screens/write_review_screen.dart';
import 'package:flutter_application/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter_application/feature/messages/presentation/screens/chat_detail_screen.dart';
import 'package:flutter_application/feature/notifications/presentation/screens/notifications_screen.dart';
import 'package:flutter_application/feature/search/data/filter_selection_model.dart';
import 'package:flutter_application/feature/search/presentation/screens/search.dart';
import 'package:flutter_application/feature/onboarding/presentation/screens/splash_screen.dart';
import 'package:flutter_application/feature/profile/presentation/screens/edit_profile_screen.dart';
import 'package:flutter_application/feature/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_application/feature/auth/presentation/screens/log_in.dart'; 
import 'package:flutter_application/feature/search/presentation/screens/filter_results_page.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/maps.dart';
import 'package:flutter_application/feature/set_location/presentation/screens/set_location_screen.dart';
import 'package:flutter_application/feature/messages/presentation/screens/messages_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/create_new_password_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/reset_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/success_reset_screen.dart';
import 'package:flutter_application/feature/reset_password/presentation/screens/verify_screen.dart';
import 'package:go_router/go_router.dart';
 
import 'package:flutter_application/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_application/feature/booking_activity/presentation/screens/booking_screen.dart';
import 'package:flutter_application/feature/booking_payement/data/my_booking_model.dart';
import 'package:flutter_application/feature/booking_payement/presentation/screens/add_card.dart';
import 'package:flutter_application/feature/booking_payement/presentation/screens/booking_pay_screen.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_application/feature/home/data/reviews_model.dart';
import 'package:flutter_application/feature/home/presentation/screens/all_reviews_screen.dart';
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
    return HomeScreen();
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
      ),
        GoRoute(
            path: '/mybooking',
            builder: (context, state){
           
          return MyBooking(status: 'completed',
      // startDate:DateTime(19,7),
      // endDate:DateTime(22,7)
      
      );} ), 
    
      
      ],),
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
        builder: (context, state) => const AuthScreen(),
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
            final data = state.extra as Map<String, dynamic>;

    final property = data['property'] as PropertyModel;
    final reviews = data['reviews'] as List<ReviewsModel>;
                return DetailsScreen(property:property, reviews:reviews,);
 

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
                GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
 

            GoRoute(
        path: '/filterResults',
        builder: (context, state) { final selectionModel = state.extra as FilterSelectionModel;
        return FilterResultsPage(selection: selectionModel);},
      ),
 

   
 
     GoRoute(
  path: '/booking&payout',
  builder: (context, state) {
    final extra = state.extra;

    // أول مرة: المستخدم جاي من تفاصيل العقار
    if (extra is Map<String, PropertyModel?>) {
      final property = extra['property'];

      return BookingPayOutScreen(
        property: property!,
      );
    }

    // المستخدم جاي من MyBooking
    if (extra is BookingModel) {
      return BookingPayOutScreen(
        property: extra.property,
        cardNumber: extra.cardNumber,
          booking: extra,
          initialStartDate: extra.startDate,
    initialEndDate: extra.endDate,
      );
    }

    throw Exception('Invalid data for BookingPayOutScreen');
  },
),  
     GoRoute(
            path: '/addCard',
            builder: (context, state){   final data = state.extra as Map<String, dynamic>;
          return AddCard( property: data['property'] as PropertyModel,
          startDate: data['startDate'],
      endDate: data['endDate'],
       cardNumber: data['cardNumber'] as String?,
      userCard: data['userCard'] as String?,
             
          );} ),
           GoRoute(
        path: '/messages',
        builder: (context, state) => const MessagesScreen(),
      ),
          
          
           GoRoute(
        path: '/chatdetails',
        builder: (context, state) => const ChatDetailScreen(name: '', imagePath: '',),
      ),
           GoRoute(
        path: '/write-review',
          builder: (context, state) {
    final property = state.extra as PropertyModel;
    return WriteReviewScreen(property: property);}
      ),
     
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),  
      
             
 
 
   GoRoute(
  path: '/allReviews',
  builder: (context, state) {
    final reviews = state.extra as List<ReviewsModel>;

    return AllReviewsScreen(
      reviews: reviews,
    );
  },
),   ]);  
   


 
      
   

    
    
      

 
 
}