import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/services/booking_manager.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_application/core/widget/custom_app_bar.dart';
import 'package:flutter_application/feature/auth/presentation/widget/auth_text_field.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/card_num_text_format.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/cridet_card_shap.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/cvv_expired_textfield.dart';
import 'package:flutter_application/feature/home/data/model.dart';
import 'package:go_router/go_router.dart';

class AddCard extends StatefulWidget {
   const AddCard({super.key, required this.property, required this.startDate, required this.endDate, this.cardNumber, this.userCard,});
 final PropertyModel property;
    final DateTime startDate;
  final DateTime endDate;
   final String? cardNumber;
  final String? userCard;
  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
 final TextEditingController _customName = TextEditingController();

 final TextEditingController _cardNumber = TextEditingController();

 final _formKey = GlobalKey<FormState>();
@override
void initState() {
  super.initState();

  _cardNumber.text = widget.cardNumber ?? '';
  _customName.text = widget.userCard ?? '';

  _cardNumber.addListener(() {
    setState(() {});
  });
}
void _onAddCard() {
  if (!_formKey.currentState!.validate()) return;

  BookingManager.saveBooking(
    property: widget.property,
    startDate: widget.startDate,
    endDate: widget.endDate,
    cardNumber: _cardNumber.text,
    userCard: _customName.text
  );

  context.pop({
  'cardNumber': _cardNumber.text,
  'userCard': _customName.text,
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(title:'Add Card', icon1:'', icon2:'', rightIcon1:false, rightIcon2:false, onPageChanged: () { context.pop(); },),

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24),
        child: Form(
            key: _formKey,
          child: Column(
            children: [
             CridetCardShap(cardController: _cardNumber,),
              SizedBox(height: 40,),
              AuthTextField(
              
                controller:_customName, labelText:'Name',hintText:'Brooklyn Simmons',
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
    CardNumberFormatter(),
    LengthLimitingTextInputFormatter(22),
  ],
               validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter card number';
          }
             final digitsOnly = value.replaceAll('  ', '');

    if (digitsOnly.length < 16) {
      return 'Card number must be 16 digits';
    }
   return null;
        },),
                SizedBox(height: 16,),
                Row(children: [Expanded(child:CvvTextField(label: 'Expired', text: '06/21',)),
                SizedBox(width:16,),
                Expanded(child:CvvTextField(label:'Cvv', text:'3134'))],),
               const SizedBox(height: 55,),
                AppButton(text:'Add Card', onPressed:_onAddCard,textColor: AppColors.whiteColor,backgroundColor: AppColors.primaryColor,),
                
            ],
          ),
        ),)
      ),
    );
  }
}

