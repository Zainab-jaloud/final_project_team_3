import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';

class BookingPayOutScreen extends StatelessWidget {
  const BookingPayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:'Booking', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false),
    );
  }
}