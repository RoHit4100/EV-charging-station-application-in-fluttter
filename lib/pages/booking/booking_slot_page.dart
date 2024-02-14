import 'package:fl_speedcharge/pages/booking/select_date.dart';
import 'package:fl_speedcharge/pages/booking/select_price.dart';
import 'package:fl_speedcharge/pages/booking/vehicle_model.dart';
import 'package:fl_speedcharge/pages/booking/vehicle_type.dart';
import 'package:fl_speedcharge/utils/constant.dart';
import 'package:fl_speedcharge/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../helper/language_constant.dart';
import 'booking_confirmation_page.dart';
import 'connection_type.dart';

class BookingSlotPage extends StatefulWidget {
  final String vehicleType;
  const BookingSlotPage({Key? key, required this.vehicleType})
      : super(key: key);

  @override
  State<BookingSlotPage> createState() => _BookingSlotPageState();
}

String? _vehicleConnectionResult;
String? _vehicleTypeResult;
String? _vehicleModelResult;
String? _dateResult;
String? _timeResult;
double? _priceResult;

class _BookingSlotPageState extends State<BookingSlotPage> {
  @override
  void dispose() {
    _vehicleConnectionResult = null;
    _vehicleTypeResult = null;
    _vehicleModelResult = null;
    _dateResult = null;
    _timeResult = null;
    _priceResult = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> vehicleTypeSelection(BuildContext context) async {
      _vehicleTypeResult = await showModalBottomSheet(
          backgroundColor: white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
          context: context,
          builder: (BuildContext context) {
            return VehicleType(hintText: _vehicleTypeResult ?? '');
          });
      setState(() {});
    }

    Future<void> vehicleModelSelection(BuildContext context) async {
      _vehicleModelResult = await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return VehicleModel(hintText: _vehicleModelResult ?? '');
        },
      );
      setState(() {});
    }

    Future<void> vehicleConnectionSelection(BuildContext context) async {
      _vehicleConnectionResult = await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return ConnectionType(
            hintText: _vehicleConnectionResult ?? '',
          );
        },
      );
      // print(_vehicleConnectionResult);
      setState(() {});
    }

    Future<void> dateSelection(BuildContext context) async {
      await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyCalender(
                        focusedDay: today,
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            if (selectedDay.isAfter(currentDate)) {
                              selectedday = selectedDay;
                              today = focusedDay;
                              formattedDate =
                                  DateFormat('d MMMM y').format(selectedDay);
                            } else if (currentDate
                                .isAtSameMomentAs(currentDate)) {
                              selectedday = currentDate;
                              today = currentDate;
                            }
                          });
                        },
                        selectedDayPredicate: (day) => isSameDay(today, day),
                        onExpansionChanged: (e) {},
                        calendarFormat: CalendarFormat.month),
                  ],
                ),
              );
            },
          );
        },
      );
      if (mounted) {
        setState(() {
          _dateResult = DateFormat('d MMMM y').format(selectedday).toString();
        });
      }
    }

    Future<void> timeSelection(BuildContext context) async {
      final TimeOfDay? result =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (result != null) {
        setState(() {
          _timeResult = result.format(context);
        });
      }
    }

    Future<void> priceSelection(BuildContext context) async {
      _priceResult = await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return SelectPrice(hintText: _priceResult ?? 0);
        },
      );
      if (mounted) {
        setState(() {});
      }
    }

    List bookSlotList = [
      {
        'title': translation(context).vehicleType,
        'hintText': _vehicleTypeResult ?? translation(context).selectYourType,
        'onTap': () {
          vehicleTypeSelection(context);
        },
      },
      {
        'title': translation(context).vehicleModel,
        'hintText': _vehicleModelResult ?? translation(context).selectYourModel,
        'onTap': () {
          vehicleModelSelection(context);
        },
      },
      {
        'title': translation(context).connectionType,
        'hintText': _vehicleConnectionResult ??
            translation(context).selectYourConnection,
        'onTap': () {
          vehicleConnectionSelection(context);
        },
      },
      {
        'title': translation(context).date,
        'hintText': _dateResult ?? translation(context).selectDate,
        'onTap': () {
          dateSelection(context);
        },
      },
      {
        'title': translation(context).time,
        'hintText': _timeResult ?? translation(context).selectTime,
        'onTap': () {
          timeSelection(context);
        },
      },
      {
        'title': translation(context).price,
        'hintText': _priceResult != null
            ? _priceResult!.toStringAsFixed(2)
            : translation(context).setPrice,
        'onTap': () {
          priceSelection(context);
        },
      },
    ];

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: MyAppBar(
              title: translation(context).bookSlot,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bookSlotList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bookSlotList[index]['title'],
                          style: blackSemiBold16),
                      heightSpace10,
                      MyContainerWithChild(
                        onTap: bookSlotList[index]['onTap'],
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 5.5.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bookSlotList[index]['hintText'],
                                style: dashLineSemiBold16),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: dashLineColor,
                              size: 1.7.h,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              heightSpace40,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  title: translation(context).conti,
                  onTap: widget.vehicleType == 'car'
                      ? () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  isIos: true,
                                  child: const BookingConfirmationPage(
                                      vehicleType: 'car'),
                                  type: PageTransitionType.rightToLeft));
                        }
                      : () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  isIos: true,
                                  child: const BookingConfirmationPage(
                                      vehicleType: 'bike'),
                                  type: PageTransitionType.rightToLeft));
                        },
                ),
              )
            ],
          ),
        ));
  }
}
