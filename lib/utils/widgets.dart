import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import 'constant.dart';

class MyContainerWithChild extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;
  final Color? shadowColor;
  final Offset? offset;
  final double? height;
  final double? width;
  final double? blurRadius;
  final double? spreadRadius;
  final BoxBorder? border;
  final Widget? child;
  final double? borderRadius;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  const MyContainerWithChild({
    Key? key,
    this.borderRadius = 10,
    this.color = white,
    this.border,
    this.child,
    this.height,
    this.width,
    this.blurRadius = 6,
    this.spreadRadius = 0,
    this.shadowColor,
    this.offset,
    this.alignment = Alignment.center,
    this.padding,
    this.margin,
    this.boxShadow,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        alignment: alignment,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius!),
            border: border,
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: shadowColor ?? colorForShadow,
                    blurRadius: blurRadius ?? 0,
                    spreadRadius: spreadRadius ?? 0,
                    offset: offset ?? const Offset(0, 0),
                  ),
                ]),
        child: child,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? blurRadius;
  final TextStyle? textStyle;
  final Color? containerColor;
  final Color? shadowColor;
  final double? height;
  final String? title;
  final VoidCallback? onTap;
  const PrimaryButton(
      {Key? key,
      this.height,
      this.title,
      this.onTap,
      this.containerColor,
      this.shadowColor,
      this.textStyle,
      this.blurRadius,
      this.padding,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        height: height ?? 5.5.h,
        decoration: BoxDecoration(
            color: containerColor ?? primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            boxShadow: [
              BoxShadow(
                blurRadius: blurRadius ?? 8,
                spreadRadius: 0,
                color: shadowColor ?? const Color(0xff007AC6).withOpacity(.25),
                offset: const Offset(0, 0),
              ),
            ]),
        child: AutoSizeText(
          title ?? '',
          style: textStyle ?? whiteBold18,
          maxLines: 1,
        ),
      ),
    );
  }
}

class PrimaryTextField extends StatelessWidget {
  final int? maxLines;
  final bool? obscureText;
  final TextEditingController? controller;
  final Alignment? alignment;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  const PrimaryTextField(
      {Key? key,
      this.height,
      this.hintText,
      this.keyboardType,
      this.textInputAction,
      this.alignment,
      this.controller,
      this.prefixIcon,
      this.obscureText,
      this.maxLines,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: alignment ?? Alignment.center,
      // height: height ?? 5.5.h,
      margin: const EdgeInsets.symmetric(vertical: 10),
      // padding: EdgeInsets.symmetric(horizontal: .65),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(blurRadius: 6, color: colorForShadow),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          maxLines: maxLines ?? 1,
          controller: controller,
          cursorColor: primaryColor,
          obscureText: obscureText ?? false,
          style: dashLineSemiBold16,
          keyboardType: keyboardType,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            // filled: true,
            // fillColor: white,
            hintText: hintText ?? '',
            hintStyle: dashLineSemiBold16,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final TextStyle? titleStyle;
  final bool? centerTitle;
  final String? title;
  const MyAppBar(
      {Key? key, this.title = '', this.centerTitle = false, this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
          statusBarColor: transparent,
        ),
        elevation: 0,
        centerTitle: centerTitle,
        title: centerTitle == false
            ? Align(
                alignment: Localizations.localeOf(context) == const Locale('ar')
                    ? const Alignment(1.2, 0)
                    : const Alignment(-1.2, 0),
                child: AutoSizeText(
                  title.toString(),
                  style: titleStyle ?? blackBold20,
                  maxLines: 1,
                ))
            : AutoSizeText(
                title.toString(),
                style: titleStyle ?? blackBold20,
                maxLines: 1,
              ));
  }
}

class MyCalender extends StatelessWidget {
  final DateTime? focusedDay;
  final Function(bool)? onExpansionChanged;
  final bool Function(DateTime)? selectedDayPredicate;
  final Function(DateTime, DateTime)? onDaySelected;
  final CalendarFormat? calendarFormat;

  const MyCalender({
    Key? key,
    this.onExpansionChanged,
    required this.calendarFormat,
    this.onDaySelected,
    this.selectedDayPredicate,
    this.focusedDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate,
      focusedDay: focusedDay ?? DateTime.now(),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: calendarFormat!,
      //swipe horizontal by swipe
      availableGestures: AvailableGestures.horizontalSwipe,
      daysOfWeekHeight: 27,
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) {
          return DateFormat('E').format(date);
        },
        weekdayStyle:
            TextStyle(fontFamily: 'M', fontSize: 8.5.sp, color: dashLineColor),
        weekendStyle:
            TextStyle(fontFamily: 'M', fontSize: 8.5.sp, color: dashLineColor),
      ),
      //for month year visible

      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        defaultDecoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(3),
        ),
        weekendDecoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(3),
        ),
        // outsideDecoration: BoxDecoration(
        //   color: white,
        //   borderRadius: BorderRadius.circular(3),
        // ),
        defaultTextStyle: blackBold16,
        todayTextStyle: whiteBold16,
        selectedTextStyle: primaryBold16,
        weekendTextStyle: blackBold16,
        // outsideTextStyle: blackBold16,
        todayDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colorForShadow,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffF0F7FF),
        ),
      ),

      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: blackBold16,
        leftChevronIcon:
            const Icon(Icons.chevron_left, color: Color(0xffB5BEC6)),
        rightChevronIcon:
            const Icon(Icons.chevron_right, color: Color(0xffB5BEC6)),
      ),
    );
  }
}
