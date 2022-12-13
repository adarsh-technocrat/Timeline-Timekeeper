import 'package:flutter/material.dart';
import 'package:timeline_timekeeper/constants/constants.dart';
import 'package:timeline_timekeeper/helpers/date_helper.dart';

class DateCard extends StatelessWidget {
  final DateTime dateItem;
  final Function(DateTime) onTap;
  final DateTime currentDate;
  final DateTime selectedDate;

  const DateCard(
      {super.key,
      required this.dateItem,
      required this.onTap,
      required this.currentDate,
      required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateHelper.getWeekday(weekday: dateItem.weekday)
              .toString()
              .toUpperCase()),
          const SizedBox(height: 8),
          SizedBox(
            height: 35,
            width: 35,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: currentDate.isAtSameMomentAs(dateItem)
                        ? Constants.kDateCardColor
                        : Colors.white,
                  ),
                  color: selectedDate.isAtSameMomentAs(dateItem)
                      ? Constants.kDateCardColor
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4), blurRadius: 1)
                  ]),
              child: InkWell(
                onTap: () {
                  onTap(dateItem);
                },
                child: Center(
                  child: Text(
                    dateItem.day.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: selectedDate == dateItem
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
