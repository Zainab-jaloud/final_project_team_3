import 'package:flutter/material.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/pay_property.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/payments.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/period.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/price_details.dart';
import 'package:flutter_application/feature/home/data/model.dart';

class BookingPayOutScreen extends StatelessWidget {
  const BookingPayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:'Booking', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false),
body: SingleChildScrollView(child: Padding(
  padding:EdgeInsets.all(24),
  child: Column(
    children: [
      PayProperty(properties: properties[0],),
      SizedBox(height: 24,),
Period(),
  SizedBox(height: 24,),
Payments(),
SizedBox(height: 24,),
PriceDetails()
    ],
  ),),),);
  }
}