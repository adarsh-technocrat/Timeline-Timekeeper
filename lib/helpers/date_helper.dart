class DateHelper {
  /// [ This Function Returns the list for past and futer date list ]

  static Map<String, int> getAllDates() {
    DateTime now = DateTime.now();

    int index = 0;
    Map<String, int> dates = {};

    // Add all past dates
    DateTime date = now.subtract(
        Duration(days: now.difference(DateTime(now.year, 1, 1)).inDays));

    while (date.isBefore(now)) {
      dates[removeTimeFromDatetime(dateTime: date)] = index;
      date = date.add(const Duration(days: 1));
      index++;
    }

    // Add all future dates

    date = now;

    while (date.isBefore(DateTime(2023, 12, 31))) {
      dates[removeTimeFromDatetime(dateTime: date)] = index;
      date = date.add(const Duration(days: 1));
      index++;
    }

    return dates;
  }

  /// [ This function return the weekdays  ]

  static String getWeekday({required int weekday}) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "Not valid Weekday";
    }
  }

  static int getIndex(String currentDate) {
    Map<String, int> date = getAllDates();
    return date[currentDate]!;
  }

  static String removeTimeFromDatetime({required DateTime dateTime}) {
    return dateTime.toIso8601String().substring(0, 10);
  }

  static convertStringToDateTime({required String dateTime}) {
    return DateTime.parse(dateTime);
  }

  static String getMonthName(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Invalid month number';
    }
  }
}
