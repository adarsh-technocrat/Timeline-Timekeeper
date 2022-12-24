import 'package:flutter/material.dart';
import 'package:timeline_timekeeper/helpers/date_helper.dart';

class DateCard extends StatelessWidget {
  final DateTime dateItem;
  final Function(DateTime) onTap;
  final DateTime currentDate;
  final DateTime selectedDate;
  final bool disablePreviousDate;
  final Color disableBorderColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final Color disableTextColor;
  final Color selectedTextColor;
  final Color unSelectedTextColor;
  final Color selectedBackgroundColor;
  final Color unSelectedBackgroundColor;
  final Color disableBackgroundColor;
  final Color currentDateBorderColor;
  final Color weekdaySelectedColor;
  final Color weekdayUnselectedColor;
  final List<BoxShadow> disableBoxShadow;
  final List<BoxShadow> selectedBoxShadow;
  final List<BoxShadow> unSelectedBoxShadow;

  const DateCard(
      {super.key,
      required this.dateItem,
      required this.onTap,
      required this.currentDate,
      required this.selectedDate,
      required this.disablePreviousDate,
      required this.disableBorderColor,
      required this.selectedBorderColor,
      required this.unSelectedBorderColor,
      required this.disableTextColor,
      required this.selectedTextColor,
      required this.unSelectedTextColor,
      required this.selectedBackgroundColor,
      required this.unSelectedBackgroundColor,
      required this.disableBackgroundColor,
      required this.currentDateBorderColor,
      required this.disableBoxShadow,
      required this.selectedBoxShadow,
      required this.weekdaySelectedColor,
      required this.weekdayUnselectedColor,
      required this.unSelectedBoxShadow});

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
            style: TextStyle(
                color: isDisable(dateItem)
                    ? disableTextColor
                    : selectedDate.isAtSameMomentAs(dateItem)
                        ? weekdaySelectedColor
                        : weekdayUnselectedColor),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 35,
            width: 35,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: isDisable(dateItem)
                        ? disableBorderColor
                        : selectedDate.isAtSameMomentAs(dateItem)
                            ? selectedBorderColor
                            : currentDate.isAtSameMomentAs(dateItem)
                                ? currentDateBorderColor
                                : Colors.white,
                  ),
                  color: isDisable(dateItem)
                      ? disableBackgroundColor
                      : selectedDate.isAtSameMomentAs(dateItem)
                          ? selectedBackgroundColor
                          : unSelectedBackgroundColor,
                  boxShadow: isDisable(dateItem)
                      ? disableBoxShadow
                      : selectedDate.isAtSameMomentAs(dateItem)
                          ? selectedBoxShadow
                          : unSelectedBoxShadow),
              child: InkWell(
                onTap: isDisable(dateItem)
                    ? null
                    : () {
                        onTap(dateItem);
                      },
                child: Center(
                  child: Text(
                    dateItem.day.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: isDisable(dateItem)
                            ? disableTextColor
                            : selectedDate.isAtSameMomentAs(dateItem)
                                ? selectedTextColor
                                : unSelectedTextColor),
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
