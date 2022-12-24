import 'package:flutter/material.dart';
import 'package:timeline_timekeeper/constants/constants.dart';
import 'package:timeline_timekeeper/widgets/timekeeper_date.dart';
import 'package:timeline_timekeeper/widgets/timekeeper_header_bar.dart';

class TimekeeperHeader extends StatefulWidget {
  final bool? showTimekeeperHeaderBar;
  final Function(DateTime dateTime) selectedDate;
  final DateTime? currentDate;
  final bool? disablePreviousDate;
  final Color? disableBorderColor;
  final Color? selectedBorderColor;
  final Color? unSelectedBorderColor;
  final Color? disableTextColor;
  final Color? selectedTextColor;
  final Color? unSelectedTextColor;
  final Color? selectedBackgroundColor;
  final Color? unSelectedBackgroundColor;
  final Color? disableBackgroundColor;
  final Color? currentDateBorderColor;
  final List<BoxShadow>? disableBoxShadow;
  final List<BoxShadow>? selectedBoxShadow;
  final List<BoxShadow>? unSelectedBoxShadow;
  final Color? weekdaySelectedColor;
  final Color? weekdayUnselectedColor;
  final Widget? Function(DateTime)? customTimekeeperHeaderBar;

  const TimekeeperHeader(
      {super.key,
      this.showTimekeeperHeaderBar,
      required this.selectedDate,
      this.currentDate,
      this.disablePreviousDate = false,
      this.disableBorderColor,
      this.selectedBorderColor = Colors.white,
      this.unSelectedBorderColor = Colors.white,
      this.disableTextColor = Colors.grey,
      this.selectedTextColor = Colors.white,
      this.unSelectedTextColor = Colors.black,
      this.selectedBackgroundColor = Constants.kDateCardColor,
      this.currentDateBorderColor = Constants.kDateCardColor,
      this.unSelectedBackgroundColor = Colors.white,
      this.disableBackgroundColor = Colors.white,
      this.disableBoxShadow,
      this.selectedBoxShadow,
      this.unSelectedBoxShadow,
      this.weekdaySelectedColor = Constants.kDateCardColor,
      this.weekdayUnselectedColor = Colors.black,
      required this.customTimekeeperHeaderBar});

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
            disableBorderColor:
                widget.disableBorderColor ?? Colors.grey.withOpacity(0.1),
            selectedBorderColor: widget.selectedBorderColor!,
            unSelectedBorderColor: widget.unSelectedBorderColor!,
            disableTextColor: widget.disableTextColor!,
            selectedTextColor: widget.selectedTextColor!,
            unSelectedTextColor: widget.unSelectedTextColor!,
            selectedBackgroundColor: widget.selectedBackgroundColor!,
            unSelectedBackgroundColor: widget.unSelectedBackgroundColor!,
            disableBackgroundColor: widget.disableBackgroundColor!,
            currentDateBorderColor: widget.currentDateBorderColor!,
            disableBoxShadow: widget.disableBoxShadow ?? [],
            selectedBoxShadow: widget.selectedBoxShadow ?? [],
            unSelectedBoxShadow: widget.unSelectedBoxShadow ?? [],
            weekdaySelectedColor: widget.weekdaySelectedColor!,
            weekdayUnselectedColor: widget.weekdayUnselectedColor!,
          )
        ],
      ),
    );
  }
}
