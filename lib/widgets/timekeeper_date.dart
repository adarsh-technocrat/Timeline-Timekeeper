import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timeline_timekeeper/helpers/date_helper.dart';
import 'package:timeline_timekeeper/widgets/date_card.dart';

class TimekeeperDate extends StatefulWidget {
  final Function(DateTime) selectedDate;
  final Widget Function(BuildContext, int)? itemBuilder;
  final DateTime currentDate;
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
  final List<BoxShadow> disableBoxShadow;
  final List<BoxShadow> selectedBoxShadow;
  final List<BoxShadow> unSelectedBoxShadow;
  final Color weekdaySelectedColor;
  final Color weekdayUnselectedColor;

  const TimekeeperDate(
      {super.key,
      required this.selectedDate,
      this.itemBuilder,
      required this.currentDate,
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
      required this.unSelectedBoxShadow,
      required this.weekdaySelectedColor,
      required this.weekdayUnselectedColor});

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
        itemBuilder: widget.itemBuilder ??
            (context, index) => DateCard(
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
                      dateTime: DateHelper.removeTimeFromDatetime(
                          dateTime: selectedDate!)),
                  dateItem: DateHelper.convertStringToDateTime(
                      dateTime: DateHelper.getAllDates().keys.toList()[index]),
                  disablePreviousDate: widget.disablePreviousDate,
                  disableBorderColor: widget.disableBorderColor,
                  selectedBorderColor: widget.selectedBorderColor,
                  unSelectedBorderColor: widget.unSelectedBorderColor,
                  disableTextColor: widget.disableTextColor,
                  selectedTextColor: widget.selectedTextColor,
                  unSelectedTextColor: widget.unSelectedTextColor,
                  selectedBackgroundColor: widget.selectedBackgroundColor,
                  unSelectedBackgroundColor: widget.unSelectedBackgroundColor,
                  disableBackgroundColor: widget.disableBackgroundColor,
                  currentDateBorderColor: widget.currentDateBorderColor,
                  disableBoxShadow: widget.disableBoxShadow,
                  selectedBoxShadow: widget.selectedBoxShadow,
                  unSelectedBoxShadow: widget.unSelectedBoxShadow,
                  weekdaySelectedColor: widget.weekdaySelectedColor,
                  weekdayUnselectedColor: widget.weekdayUnselectedColor,
                ),
      ),
    );
  }
}
