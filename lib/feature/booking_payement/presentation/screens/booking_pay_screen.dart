import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/booking_payement/data/my_booking_model.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/pay_property.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/payments.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/period.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/price_details.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/success_bottomsheet.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:go_router/go_router.dart';

class BookingPayOutScreen extends StatefulWidget {
  const BookingPayOutScreen({super.key,this.cardNumber, required this.property,});
 final String ?cardNumber;
  final PropertyModel property;
 
  @override
  State<BookingPayOutScreen> createState() => _BookingPayOutScreenState();
}

class _BookingPayOutScreenState extends State<BookingPayOutScreen> {
    String? _cardNumber;
     DateTime? startDate;
    DateTime? endDate;
  @override
  void initState() {
    super.initState();
    _cardNumber = widget.cardNumber;
  }
  Future<void> _openAddCard() async {
  final cardNumber = await context.push<String>(
  '/addCard',
    extra: {
    'property': widget.property,
    'startDate':   startDate,
    'endDate':   endDate,
  },
);

  if (cardNumber != null) {
    setState(() {
      _cardNumber = cardNumber;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(title:'Booking', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false, onPageChanged: () { (context).pop(); },),

body: SingleChildScrollView(child: Padding(
  padding:EdgeInsets.all(24),
  child: Column(
    children: [
      PayProperty(properties:widget.property,),
      SizedBox(height: 24,),
Period(onDateSelected:(start, end) {
    setState(() {
     startDate = start;
      endDate = end;
    });
  },),
  SizedBox(height: 24,),
  
Payments(cardNumber: _cardNumber,onAddCard: _openAddCard
),    
     
    
  
SizedBox(height: 24,),
PriceDetails(),
SizedBox(height: 26,),
if(_cardNumber != null)
AppButton(textColor: AppColors.whiteColor,
backgroundColor: AppColors.primaryColor,
  text: 'Confirm and Pay',
  onPressed: () {
    setState(() {
      BookingManager.confirmBooking(widget.property);
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => MyBottomSheet(
        image: AppImages.success,
        title: 'Yey, your booking success',
        
        text: DefaultTextStyle(
          style: AppTextStyle.optionLabelStyle.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
          child: const Text(
            'you have successfully booked a property,\nenjoy your property',
          ),
        ),
        withButton: true,
        buttonText: 'Explore more',
        onPressed: () {
          Navigator.pop(context);
          context.go('/home');
        },
      ),
    );
  },
)
else
 SizedBox()
]))));}}