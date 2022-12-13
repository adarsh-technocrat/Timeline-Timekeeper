import 'package:flutter/material.dart';

import '../widgets/timekeeper_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            TimekeeperHeader(showTimekeeperHeaderBar: true),
          ],
        ),
      ),
    );
  }
}