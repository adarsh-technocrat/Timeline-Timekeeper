import 'package:flutter/material.dart';
import 'package:timeline_timekeeper/constants/constants.dart';
import 'package:timeline_timekeeper/helpers/date_helper.dart';
import 'package:timeline_timekeeper/helpers/ui_helper.dart';
import 'package:timeline_timekeeper/widgets/timekeeper_date.dart';
import 'package:timeline_timekeeper/widgets/timekeeper_header_bar.dart';

class TimekeeperHeader extends StatefulWidget {
  final bool? showTimekeeperHeaderBar;
  final Function(DateTime dateTime) selectedDate;
  final DateTime? currentDate;
  final bool? disablePreviousDate;
  final Widget? Function(DateTime)? customTimekeeperHeaderBar;
  final BoxDecoration? curentDateDecoration;
  final BoxDecoration? selectedDateDecoration;
  final BoxDecoration? unselectedDateDecoration;
  final BoxDecoration? disableDateDecoration;
  final TextStyle? curentDateTextStyle;
  final TextStyle? selectedDateTextStyle;
  final TextStyle? unSelectedDateTextStyle;
  final TextStyle? disableDateTextStyle;
  final TextStyle? curentWeekDayTextStyle;
  final TextStyle? selectedWeekDayStyle;
  final TextStyle? unSelectedWeekDayTextStyle;
  final TextStyle? disableWeekDayTextStyle;

  const TimekeeperHeader({
    super.key,
    this.showTimekeeperHeaderBar,
    required this.selectedDate,
    this.currentDate,
    this.disablePreviousDate = false,
    this.customTimekeeperHeaderBar,
    this.curentDateDecoration,
    this.selectedDateDecoration,
    this.unselectedDateDecoration,
    this.disableDateDecoration,
    this.curentDateTextStyle,
    this.selectedDateTextStyle,
    this.unSelectedDateTextStyle,
    this.disableDateTextStyle,
    this.curentWeekDayTextStyle,
    this.selectedWeekDayStyle,
    this.unSelectedWeekDayTextStyle,
    this.disableWeekDayTextStyle,
  });

  @override
  State<TimekeeperHeader> createState() => _TimekeeperHeaderState();
}

class _TimekeeperHeaderState extends State<TimekeeperHeader> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.showTimekeeperHeaderBar!
              ? widget.customTimekeeperHeaderBar!(date ?? DateTime.now()) ??
                  TimekeeperHeaderBar(
                    dateTime: date ?? DateTime.now(),
                  )
              : const SizedBox(),
          TimekeeperDate(
            selectedDate: (selectedDateTime) {
              setState(() {
                date = selectedDateTime;
                widget.selectedDate(selectedDateTime);
              });
            },
            currentDate: widget.currentDate ?? DateTime.now(),
            disablePreviousDate: widget.disablePreviousDate!,
            curentDateDecoration: widget.curentDateDecoration ??
                UIHelper.boxDecoration(
                  borderColor: Constants.kDateCardColor,
                  boxShadowColor: Constants.kCurrentCardColor,
                  backgroundColor: Constants.kCurrentCardColor,
                ),
            curentDateTextStyle: widget.curentDateTextStyle ??
                UIHelper.textStyle(
                    fontColor: Constants.kDateCardColor,
                    fontWeight: FontWeight.normal),
            disableDateDecoration: widget.disableDateDecoration ??
                UIHelper.boxDecoration(
                    borderColor: Colors.grey,
                    boxShadowColor: Colors.grey.withOpacity(0.1),
                    backgroundColor: Colors.white),
            disableDateTextStyle: widget.disableDateTextStyle ??
                UIHelper.textStyle(
                    fontColor: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.normal),
            selectedDateDecoration: widget.selectedDateDecoration ??
                UIHelper.boxDecoration(
                  borderColor: Colors.white,
                  boxShadowColor: Constants.kDateCardColor,
                  backgroundColor: Constants.kDateCardColor,
                ),
            selectedDateTextStyle: widget.selectedDateTextStyle ??
                UIHelper.textStyle(
                    fontColor: Colors.white, fontWeight: FontWeight.bold),
            unSelectedDateTextStyle: widget.unSelectedDateTextStyle ??
                UIHelper.textStyle(
                    fontColor: Constants.kDateCardColor,
                    fontWeight: FontWeight.normal),
            unselectedDateDecoration: widget.unselectedDateDecoration ??
                UIHelper.boxDecoration(
                    borderColor: Constants.kDateCardColor,
                    boxShadowColor: Constants.kDateCardColor,
                    backgroundColor: Colors.white),
            curentWeekDayTextStyle: widget.curentWeekDayTextStyle ??
                UIHelper.textStyle(
                    fontColor: Constants.kDateCardColor,
                    fontWeight: FontWeight.normal),
            disableWeekDayTextStyle: widget.disableWeekDayTextStyle ??
                UIHelper.textStyle(
                    fontColor: Colors.grey.withOpacity(0.4),
                    fontWeight: FontWeight.normal),
            selectedWeekDayStyle: UIHelper.textStyle(
                fontColor: Constants.kDateCardColor,
                fontWeight: FontWeight.bold),
            unSelectedWeekDayTextStyle: UIHelper.textStyle(
                fontColor: Constants.kDateCardColor,
                fontWeight: FontWeight.normal),
            listOfDates: DateHelper.getAllDates(),
            onEndReach: () {
              print("This is the Endlist");
            },
          ),
        ],
      ),
    );
  }
}
