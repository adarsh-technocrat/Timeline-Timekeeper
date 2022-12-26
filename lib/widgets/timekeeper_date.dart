import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:timeline_timekeeper/helpers/date_helper.dart';
import 'package:timeline_timekeeper/widgets/date_card.dart';

class TimekeeperDate extends StatefulWidget {
  final Function(DateTime) selectedDate;
  final DateTime currentDate;
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

  const TimekeeperDate(
      {super.key,
      required this.selectedDate,
      required this.currentDate,
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
  State<TimekeeperDate> createState() => _TimekeeperDateState();
}

class _TimekeeperDateState extends State<TimekeeperDate> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  DateTime? selectedDate;

  @override
  void initState() {
    selectedDate = widget.currentDate;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemScrollController.jumpTo(
          index: DateHelper.getIndex(
              DateHelper.removeTimeFromDatetime(dateTime: widget.currentDate)));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 9,
      child: ScrollablePositionedList.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: DateHelper.getAllDates().length,
        itemPositionsListener: itemPositionsListener,
        itemScrollController: itemScrollController,
        itemBuilder: (context, index) => DateCard(
          onTap: (dateTime) {
            setState(() {
              selectedDate = dateTime;
              widget.selectedDate(dateTime);
            });
          },
          currentDate: DateHelper.convertStringToDateTime(
              dateTime: DateHelper.removeTimeFromDatetime(
                  dateTime: widget.currentDate)),
          selectedDate: DateHelper.convertStringToDateTime(
              dateTime:
                  DateHelper.removeTimeFromDatetime(dateTime: selectedDate!)),
          dateItem: DateHelper.convertStringToDateTime(
              dateTime: DateHelper.getAllDates().keys.toList()[index]),
          disablePreviousDate: widget.disablePreviousDate,
          curentDateDecoration: widget.curentDateDecoration,
          curentDateTextStyle: widget.curentDateTextStyle,
          disableDateDecoration: widget.disableDateDecoration,
          disableDateTextStyle: widget.disableDateTextStyle,
          selectedDateDecoration: widget.selectedDateDecoration,
          unSelectedDateTextStyle: widget.unSelectedDateTextStyle,
          selectedDateTextStyle: widget.selectedDateTextStyle,
          unselectedDateDecoration: widget.unselectedDateDecoration,
          curentWeekDayTextStyle: widget.curentWeekDayTextStyle,
          disableWeekDayTextStyle: widget.disableWeekDayTextStyle,
          selectedWeekDayStyle: widget.selectedWeekDayStyle,
          unSelectedWeekDayTextStyle: widget.unSelectedWeekDayTextStyle,
        ),
      ),
    );
  }
}
