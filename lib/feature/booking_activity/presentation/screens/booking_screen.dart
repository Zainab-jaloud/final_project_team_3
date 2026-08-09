import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/services/booking_manager.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/booking_activity/presentation/widget/cancelled_widget.dart';
import 'package:flutter_application/feature/booking_activity/presentation/widget/completed_widget.dart';
import 'package:flutter_application/feature/booking_activity/presentation/widget/no_booking.dart';
import 'package:flutter_application/feature/booking_activity/presentation/widget/status_widget.dart';
import 'package:flutter_application/feature/booking_payement/data/my_booking_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MyBooking extends StatelessWidget {
  const MyBooking({super.key, required this.status, this.startDate, this.endDate});
final String status;
final DateTime? startDate;
final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
  length: 3,
  child: Scaffold(
     appBar: CustomAppBar(title:'My Booking', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false, onPageChanged: () {
      context.go('/home');},),
    body: 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      child: Column(
        children: [
         Container(width: 327.sw, 
        decoration: BoxDecoration(
      color: AppColors.borderColor,
         borderRadius: BorderRadius.circular(8),
        ),
        
        child: TabBar(
      indicator: BoxDecoration(
        color:AppColors.primaryColor,
        borderRadius: BorderRadius.circular(4),
        
      ),
        indicatorPadding: EdgeInsets.symmetric(
      horizontal:-16,
      vertical: 6,
        ),
      dividerColor: Colors.transparent,
      labelStyle:AppTextStyle.fasilitiesTextStyl.copyWith(fontSize: 16,color: AppColors.whiteColor),
      unselectedLabelStyle:AppTextStyle.optionLabelStyle.copyWith(fontSize: 16,color: AppColors.locationColor,),
      tabs: const [
        Tab(text: "Upcoming"),
        Tab(text: "Completed"),
         Tab(text: "Cancelled"),
      ],
        ),
      ),
      SizedBox(height: 33,),
          Expanded(
            child: TabBarView(
              children: [
                 BookingManager.bookings.isEmpty
          ? 
          NoBooking()
          :ListView.builder(  itemCount:BookingManager.bookings.length,
                itemBuilder:(context,index){
                  final booking = BookingManager.bookings[index];
      return  GestureDetector(
  onTap: () {
    context.push(
     '/booking&payout',
      extra: booking,
    );
  },
        child: PropertyStatus(properties: booking.property,status: booking.status, 
       date:
        '${DateFormat('dd MMM').format(booking.startDate)} - '
        '${DateFormat('dd MMM').format(booking.endDate)}',
              ),
      );
              }),
                CompletedWidget(),
             CancelledWidget()
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
}
