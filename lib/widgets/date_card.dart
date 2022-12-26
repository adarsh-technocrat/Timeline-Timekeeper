import 'package:flutter/material.dart';
import 'package:timeline_timekeeper/helpers/date_helper.dart';

class DateCard extends StatelessWidget {
  final DateTime dateItem;
  final Function(DateTime) onTap;
  final DateTime currentDate;
  final DateTime selectedDate;
  final bool disablePreviousDate;
  final BoxDecoration curentDateDecoration;
  final BoxDecoration selectedDateDecoration;
  final BoxDecoration unselectedDateDecoration;
  final BoxDecoration disableDateDecoration;
  final TextStyle curentDateTextStyle;
  final TextStyle selectedDateTextStyle;
  final TextStyle unSelectedDateTextStyle;
  final TextStyle disableDateTextStyle;
  final TextStyle curentWeekDayTextStyle;
  final TextStyle selectedWeekDayStyle;
  final TextStyle unSelectedWeekDayTextStyle;
  final TextStyle disableWeekDayTextStyle;

  const DateCard(
      {super.key,
      required this.dateItem,
      required this.onTap,
      required this.currentDate,
      required this.selectedDate,
      required this.disablePreviousDate,
      required this.curentDateDecoration,
      required this.selectedDateDecoration,
      required this.unselectedDateDecoration,
      required this.disableDateDecoration,
      required this.curentDateTextStyle,
      required this.selectedDateTextStyle,
      required this.unSelectedDateTextStyle,
      required this.disableDateTextStyle,
      required this.curentWeekDayTextStyle,
      required this.selectedWeekDayStyle,
      required this.unSelectedWeekDayTextStyle,
      required this.disableWeekDayTextStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateHelper.getWeekday(weekday: dateItem.weekday)
                .toString()
                .toUpperCase(),
            style: isDisable(dateItem)
                ? disableWeekDayTextStyle
                : selectedDate.isAtSameMomentAs(dateItem)
                    ? selectedWeekDayStyle
                    : currentDate.isAtSameMomentAs(dateItem)
                        ? curentWeekDayTextStyle
                        : unSelectedWeekDayTextStyle,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 35,
            width: 35,
            child: Container(
              decoration: isDisable(dateItem)
                  ? disableDateDecoration
                  : selectedDate.isAtSameMomentAs(dateItem)
                      ? selectedDateDecoration
                      : currentDate.isAtSameMomentAs(dateItem)
                          ? curentDateDecoration
                          : unselectedDateDecoration,
              child: InkWell(
                onTap: isDisable(dateItem)
                    ? null
                    : () {
                        onTap(dateItem);
                      },
                child: Center(
                  child: Text(
                    dateItem.day.toString(),
                    style: isDisable(dateItem)
                        ? disableDateTextStyle
                        : selectedDate.isAtSameMomentAs(dateItem)
                            ? selectedDateTextStyle
                            : currentDate.isAtSameMomentAs(dateItem)
                                ? curentDateTextStyle
                                : unSelectedDateTextStyle,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isDisable(DateTime dateItem) {
    return disablePreviousDate ? dateItem.isBefore(currentDate) : false;
  }
}
