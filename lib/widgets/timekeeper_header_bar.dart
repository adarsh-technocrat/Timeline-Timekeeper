import 'package:flutter/material.dart';

import '../helpers/date_helper.dart';

class TimekeeperHeaderBar extends StatelessWidget {
  final DateTime dateTime;

  const TimekeeperHeaderBar({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final monthNumber = dateTime.month;
    final year = dateTime.year;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
              )),
          Text(
            "${DateHelper.getMonthName(monthNumber)}  $year",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
