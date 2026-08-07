import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/feature/booking_payement/presentation/widget/tabel_calender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
 

class Period extends StatefulWidget {
  const Period({super.key, required this.onDateSelected,});
 

  final Function(DateTime start, DateTime end) onDateSelected;
  @override
  State<Period> createState() => _PeriodState();
}

class _PeriodState extends State<Period> {
 
DateTime? startDate;
DateTime? endDate;

Future<void> openDatePicker() async {
  final result = await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
      backgroundColor: Colors.transparent,
       // ignore: deprecated_member_use
       barrierColor: Colors.black.withOpacity(0.1),
    builder: (_) => const DatePickerBottomSheet(),
  );

 if (result != null) {
  setState(() {
    startDate = result['start'];
    endDate = result['end'];
  });

  widget.onDateSelected(
    startDate!,
    endDate!,
  );
}
}
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 327.sw,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Period',style: AppTextStyle.heading1.copyWith(fontSize: 16),),
        SizedBox(height: 16,),
        SizedBox(width: 331.w,
          child: Row(children: [ Container(width:36,height:36,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:AppColors.svgBackground,
          ),
          child: Padding(padding: EdgeInsets.all(6),
          child: SvgPicture.asset('assets/icons/Calendar.svg',)),),
          SizedBox(width: 12,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Date',style:AppTextStyle.optionLabelStyle,),
         Text(
  startDate == null
      ? 'Set time on your calendar'
      : '${DateFormat('dd MMM').format(startDate!)}-${DateFormat('dd MMM ').format(endDate!)}',
  style: AppTextStyle.optionValueStyle,
),],) ,
          Spacer(),
         GestureDetector(onTap:openDatePicker
          ,child: SvgPicture.asset('assets/icons/arrow_foraward.svg'))
           ]),
           
        ),
        SizedBox(height: 12,),
        Divider(color: AppColors.borderColor,thickness: 0.5,
        ),
        SizedBox(height: 5,),
        Text('Make sure to check your date before making any\nsort of payments',style:AppTextStyle.optionLabelStyle,)
      ],),
    );
  }
}