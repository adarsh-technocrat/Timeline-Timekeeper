import 'package:flutter/material.dart';

import '../widgets/timekeeper_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TimekeeperHeader(
              showTimekeeperHeaderBar: true,
              customTimekeeperHeaderBar: (DateTime dateTime) => null,
              currentDate: DateTime.now(),
              selectedDate: (DateTime dateTime) {},
            ),
          ],
        ),
      ),
    );
  }
}
