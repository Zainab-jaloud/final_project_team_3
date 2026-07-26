import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/row_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 327.sw,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Payments',style: AppTextStyle.optionValueStyle.copyWith(fontSize: 16),),
        SizedBox(height: 16,),
         RowTile(leftIcon: 'assets/icons/Card.svg', rightIcon: 'assets/icons/Add.svg', text: 'Credit or Debit card',),
         SizedBox(height: 8,),
         RowTile(leftIcon:'assets/icons/Logo.svg', rightIcon: 'assets/icons/Add.svg', text: 'Paypal',),
            SizedBox(height: 12,),
        Divider(color: AppColors.borderColor,thickness: 0.5),
           SizedBox(height: 12,),
           Text('Enter a Voucher',style: AppTextStyle.optionValueStyle.copyWith(fontSize: 12,
           decoration: TextDecoration.underline,
           decorationStyle: TextDecorationStyle.solid,
           decorationColor: AppColors.titleColor),)
        ]),
    );
  }
}

