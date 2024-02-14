import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/constant.dart';
import '../../utils/widgets.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({Key? key}) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectDateState();
}

DateTime currentDate = DateTime.now();
DateTime tommorowDate = currentDate.add(const Duration(days: 1));
String currentFormattedTime = DateFormat('jm').format(currentDate);
String currentFormattedDate = DateFormat('d MMMM y').format(currentDate);
String tommorowFormattedDate = DateFormat('d MMMM y').format(tommorowDate);
DateTime selectedday = DateTime.now();
DateTime today = DateTime.now();
String? formattedDate;

class _SelectDateState extends State<SelectDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text('Select date', style: blackBold18),
        ),
        MyCalender(
          focusedDay: today,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              if (selectedDay.isAfter(currentDate)) {
                selectedday = selectedDay;
                today = focusedDay;
                formattedDate = DateFormat('d MMMM y').format(selectedDay);
              } else if (currentDate.isAtSameMomentAs(currentDate)) {
                selectedday = currentDate;
                today = currentDate;
              }
            });
          },
          selectedDayPredicate: (day) => isSameDay(today, day),
          onExpansionChanged: (e) {
            // setState(() {
            //   calendarType = !calendarType;
            // });
          },
          calendarFormat: CalendarFormat.month,
        ),
        heightSpace20,
      ],
    );
  }
}
