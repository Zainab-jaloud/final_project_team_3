import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/services/booking_manager.dart';
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
  const BookingPayOutScreen({super.key,this.cardNumber, required this.property, this.initialStartDate, this.initialEndDate, this.booking,});
 final String ?cardNumber;
  final PropertyModel property;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
    final BookingModel? booking;
  @override
  State<BookingPayOutScreen> createState() => _BookingPayOutScreenState();
}

class _BookingPayOutScreenState extends State<BookingPayOutScreen> {
    String? _cardNumber;
     DateTime? startDate;
    DateTime? endDate;
    PaymentMethod selectedPaymentMethod = PaymentMethod.card;
  @override
  void initState() {
    super.initState();
    _cardNumber = widget.cardNumber;
      startDate = widget.initialStartDate;
  endDate = widget.initialEndDate;
  }
 Future<void> _openAddCard() async {
  if (startDate == null || endDate == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select a booking date first'),
      ),
    );
    return;
  }

  final booking = BookingManager.getBookingByProperty(
    widget.property,
  );

  final cardNumber = await context.push(
    '/addCard',
    extra: {
      'property': widget.property,
      'startDate': startDate!,
      'endDate': endDate!,
      'cardNumber': booking?.cardNumber,
      'userCard': booking?.userCard,
    },
  );

if (cardNumber != null) {
  final data = cardNumber as Map<String, dynamic>;

  setState(() {
    _cardNumber = data['cardNumber'] as String?;
  });
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:'Booking', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false, onPageChanged: () {context.pop();},),
body: SingleChildScrollView(child: Padding(
  padding:EdgeInsets.all(24),
  child: Column(
    children: [
      PayProperty(properties:widget.property,),
      SizedBox(height: 24,),
Period(
  initialStartDate: startDate,
  initialEndDate: endDate,
  onDateSelected: (start, end) {
    setState(() {
      startDate = start;
      endDate = end;
    });

    if (widget.booking != null) {
      BookingManager.updateBookingDate(
        booking: widget.booking!,
        startDate: start,
        endDate: end,
      );
    }
  },
),
  SizedBox(height: 24,),
  
Payments(cardNumber: _cardNumber,onAddCard: _openAddCard,
 onPaymentMethodChanged: (PaymentMethod method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }, 

selectedMethod:selectedPaymentMethod,
),    
     
    
  
SizedBox(height: 24,),
PriceDetails(),
SizedBox(height: 26,),
if(_cardNumber != null)
AppButton(
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