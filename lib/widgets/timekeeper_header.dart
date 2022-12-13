import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:timeline_timekeeper/widgets/timekeeper_date.dart';
import 'package:timeline_timekeeper/widgets/timekeeper_header_bar.dart';

class TimekeeperHeader extends StatefulWidget {
  final bool showTimekeeperHeaderBar;

  const TimekeeperHeader({super.key, this.showTimekeeperHeaderBar = true});

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
          widget.showTimekeeperHeaderBar
              ? TimekeeperHeaderBar(
                  dateTime: date ?? DateTime.now(),
                )
              : const SizedBox(),
          TimekeeperDate(
            selectedDate: (selectedDateTime) {
              setState(() {
                date = selectedDateTime;
              });
            },
          )
        ],
      ),
    );
  }
}
