import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_color.dart';
import 'package:flutter_application/core/constants/booking_constants.dart';
import 'package:flutter_application/core/constants/text_style.dart';
import 'package:flutter_application/core/widget/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({super.key}) ;

  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  DateTime _focusedDay = DateTime(2022, 8, 1);
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  PageController? _pageController;
//   final List<DateTime> bookedDays = [
//   DateTime(2022, 8, 10),
//   DateTime(2022, 8, 12),
// ];
bool _isBooked(DateTime day) {
  return !day.isBefore(BookingConstants.bookingStart) &&
      !day.isAfter(BookingConstants.bookingEnd);
}
void _showBookedMessage() {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('This day is already booked'),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: 
        BorderRadius.vertical(top: Radius.circular(45)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. مقبض السحب الأعلى (Drag Handle)
          Container(
            width: 43,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(height: 16),

          // 2. العنوان الرئيسي
          Text(
            'Select Date',
            style: AppTextStyle.optionValueStyle.copyWith(fontSize: 17),
          ),
          const SizedBox(height: 38),

          // 3. عنصر شريط التقويم المصغر (Calendar Header Tile)
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  color: AppColors.svgBackground,
                ),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: SvgPicture.asset('assets/icons/Calendar.svg'),
                ),
              ),
              SizedBox(width: 9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 3,
                children: [
                  Text('Calendar', style: AppTextStyle.optionValueStyle),
                  Text(
                    'Set time on your calendar',
                    style: AppTextStyle.optionLabelStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Divider(color: AppColors.borderColor, thickness: 0.7),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(_focusedDay),
                  style: AppTextStyle.optionValueStyle.copyWith(fontSize: 18),
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {
                    _pageController?.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/ArrowLeftCircle.svg',
                    colorFilter: ColorFilter.mode(
                      AppColors.titleColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    _pageController?.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  child: SvgPicture.asset('assets/icons/ArrowRightCircle.svg'),
                ),
              ],
            ),
          ),
          SizedBox(height: 11),
          // 4. التقويم (Table Calendar)
          SizedBox(
            width: 330.w,
            child: TableCalendar(
              enabledDayPredicate: (day) {
  return !BookingConstants.bookedDays.any(
    (booked) => isSameDay(booked, day),
  );
},
       headerVisible: false,
              rowHeight: 40,
              daysOfWeekHeight: 46,
              onCalendarCreated: (controller) {
                _pageController = controller;
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              rangeSelectionMode: RangeSelectionMode.toggledOn,
onRangeSelected: (start, end, focusedDay) {
  if (start != null &&_isBooked(start)) {
    _showBookedMessage();
    return;
  }
  
  setState(() {
    _focusedDay = focusedDay;
    _rangeStart = start;
    _rangeEnd = end;
  });
},        // تحديد نطاق التواريخ (Start & End)
             
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
    onDaySelected: (selectedDay, focusedDay) {
if (_isBooked(selectedDay)) {
  _showBookedMessage();
  return;
}

 


  setState(() {
    _focusedDay = focusedDay;

    if (_rangeStart == null || _rangeEnd != null) {
      _rangeStart = selectedDay;
      _rangeEnd = selectedDay; // نفس اليوم
    } else {
      if (selectedDay.isBefore(_rangeStart!)) {
        _rangeEnd = _rangeStart;
        _rangeStart = selectedDay;
      } else {
        _rangeEnd = selectedDay;
      }
    }
  });
},

              // تخصيص أيام الأسبوع (Sun, Mon, ...)
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTextStyle.fasilitiesTextStyl.copyWith(
                  fontSize: 16,
                ),
                weekendStyle: AppTextStyle.fasilitiesTextStyl.copyWith(
                  fontSize: 16,
                ),
              ),

             calendarBuilders: CalendarBuilders(
    defaultBuilder: (context, day, focusedDay) {
        final start = DateTime(2022, 8, 10);
  final end = DateTime(2022, 8, 12);
      
    if (day.isAfter(start) && day.isBefore(end)) {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEADBFF),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: const TextStyle(color: Colors.black),
        ),
      );
    }
      return null;
    },
 

disabledBuilder: (context, day, focusedDay) {
 
if (BookingConstants.bookedDays.any((d) => isSameDay(d, day))) {
        return Container(
          margin:EdgeInsets.zero,
          decoration: BoxDecoration(
            color:AppColors.secondaryColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style:AppTextStyle.optionLabelStyle.copyWith(fontSize: 16,color: AppColors.whiteColor)   
          ),
        );
      }
   

  return null;
},

                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.borderColor,
                            width: 0.7,
                          ),
                        ),
                      ),
                      child: Text(
                        text,
                        style: AppTextStyle.fasilitiesTextStyl.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
              // تخصيص ألوان وتصميم الأيام والنطاق المكتمل
              calendarStyle: CalendarStyle(
                outsideDaysVisible: true,
                defaultTextStyle: AppTextStyle.optionLabelStyle.copyWith(
                  fontSize: 16,
                  color: const Color(0xFF000000),
                ),

                withinRangeTextStyle: AppTextStyle.optionLabelStyle.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
                rangeStartTextStyle: AppTextStyle.optionLabelStyle.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),

                rangeEndTextStyle: AppTextStyle.optionLabelStyle.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
                outsideTextStyle: AppTextStyle.optionLabelStyle.copyWith(
                  fontSize: 16,
                ),
                weekendTextStyle: AppTextStyle.optionLabelStyle.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
                cellMargin: EdgeInsets.all(1),
                // لون اليوم الأولي والنهائي المختار
                rangeStartDecoration: const BoxDecoration(
                  color: Color(0xFF6C4AB6),
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: Color(0xFF6C4AB6),
                  shape: BoxShape.circle,
                ),

                rangeHighlightColor: AppColors.pagescolor,
                withinRangeDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEADBFF),
                ),
              ),
            ),
          ),
          const SizedBox(height: 68),

          AppButton(
            text: 'Save',
            onPressed: () {
  Navigator.pop(
    context,
    {
      'start': _rangeStart,
      'end': _rangeEnd ?? _rangeStart,
    },
  );
}
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
