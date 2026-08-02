import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/auth/presentation/widget/auth_text_field.dart';
import 'package:flutter_application/feature/booking_payement/data/my_booking_model.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/cvv_expired_textfield.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddCard extends StatefulWidget {
 const  AddCard({super.key, required this.property, this.startDate, this.endDate});
 final PropertyModel property;
    final DateTime? startDate;
  final DateTime? endDate;
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
 final TextEditingController _customName = TextEditingController();

 final TextEditingController _cardNumber = TextEditingController();

 final _formKey = GlobalKey<FormState>();
 DateTime? startDate;
    DateTime? endDate;
    void _onAddCard() {
  if (widget.startDate == null || widget.endDate == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select a booking date first'),
      ),
    );
    return;
  }

  if (!_formKey.currentState!.validate()) return;

  BookingManager.saveBooking(
    property: widget.property,
    startDate: widget.startDate!,
    endDate: widget.endDate!,
  );

  context.pop(_cardNumber.text);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:'Add Card', onPageChanged: () => (context).pop(),icon1:'', icon2:'', rightIcon1:false, rightIcon2:false),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24),
        child: Form(
            key: _formKey,
          child: Column(
            children: [
              SizedBox(width: 327.sw,child: Image.asset(AppImages.creditCard)),
              SizedBox(height: 40,),
              AuthTextField(controller:_customName, labelText:'Name',hintText:'Brooklyn Simmons',
                validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter your name';
          }

          if (RegExp(r'\d').hasMatch(value)) {
            return 'Name must not contain numbers';
          }

          return null;
        },),
              SizedBox(height: 16,),
              AuthTextField(controller:_cardNumber, labelText:'Card Number',hintText:'1234************',
              inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(16),
  ],
               validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter card number';
          }
   return null;
        },),
                SizedBox(height: 16,),
                Row(children: [Expanded(child:CvvTextField(label: 'Expired', text: '06/21',)),
                SizedBox(width:16,),
                Expanded(child:CvvTextField(label:'Cvv', text:'3134'))],),
               const SizedBox(height: 55,),
                AppButton(text:'Add Card', onPressed:_onAddCard,),
                
            ],
          ),
        ),)
      ),
    );
  }
}

