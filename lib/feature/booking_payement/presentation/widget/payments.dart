import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/app_images.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/row_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 enum PaymentMethod {
  card,
  paypal,
}
class Payments extends StatefulWidget {
  const Payments({super.key, this.cardNumber, required this.onAddCard, required this.onPaymentMethodChanged, required this.selectedMethod});
final String ? cardNumber;
  final PaymentMethod selectedMethod;
final Future<void> Function() onAddCard;
 final Function(PaymentMethod) onPaymentMethodChanged;
  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
     bool isPaypalSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 327.sw,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Payments',style: AppTextStyle.heading1.copyWith(fontSize: 16),),
        SizedBox(height: 16,),
     widget.cardNumber == null?
      Column(children: [  
         if (widget.selectedMethod == PaymentMethod.card)
      RowTile(
        leftIcon: 'assets/icons/Card.svg',
        rightIcon: 'assets/icons/Add.svg',
        text: 'Credit or Debit card',
        onTap: widget.onAddCard,
      ),

    if (widget.selectedMethod == PaymentMethod.card)
      const SizedBox(height: 8),

    // PayPal
    RowTile(
      leftIcon: 'assets/icons/Logo.svg',
      rightIcon: widget.selectedMethod == PaymentMethod.paypal
          ? 'assets/icons/Check.svg'
          : 'assets/icons/Add.svg',
      text: 'Paypal',
      onTap: () {
        widget.onPaymentMethodChanged(
          PaymentMethod.paypal,
        );
      },
    ),])
         :
         Row(children: [SizedBox(width: 41,height: 32,child: Image.asset(AppImages.logo)),
         SizedBox(width: 16,),
         Text("...........${widget.cardNumber!.substring(widget.cardNumber!.length - 4)}",style: AppTextStyle.optionLabelStyle.copyWith(color:AppColors.titleColor,fontSize: 14),),
         Spacer(),
         TextButton(  onPressed: widget.onAddCard,
         child:Text('Edite',style:AppTextStyle.optionValueStyle.copyWith(fontSize: 12),),
       )],),
            SizedBox(height: 12,),
        Divider(color: AppColors.borderColor,thickness: 0.5),
           SizedBox(height: 12,),
           Text('Enter a Voucher',style: AppTextStyle.heading1.copyWith(fontSize: 12,
           decoration: TextDecoration.underline,
           decorationStyle: TextDecorationStyle.solid,
           decorationColor: AppColors.titleColor),)
        ]),
    );
  }
}

