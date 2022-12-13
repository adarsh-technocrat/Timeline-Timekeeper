import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timeline_timekeeper/helpers/date_helper.dart';
import 'package:timeline_timekeeper/widgets/date_card.dart';

class TimekeeperDate extends StatefulWidget {
  final Function(DateTime) selectedDate;

  const TimekeeperDate({super.key, required this.selectedDate});

  @override
  State<TimekeeperDate> createState() => _TimekeeperDateState();
}

class _TimekeeperDateState extends State<TimekeeperDate> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  DateTime currentDateTime = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemScrollController.jumpTo(
          index: DateHelper.getIndex(
              DateHelper.removeTimeFromDatetime(dateTime: currentDateTime)));
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
              dateTime:
                  DateHelper.removeTimeFromDatetime(dateTime: currentDateTime)),
          selectedDate: DateHelper.convertStringToDateTime(
              dateTime:
                  DateHelper.removeTimeFromDatetime(dateTime: selectedDate)),
          dateItem: DateHelper.convertStringToDateTime(
              dateTime: DateHelper.getAllDates().keys.toList()[index]),
        ),
      ),
    );
  }
}
