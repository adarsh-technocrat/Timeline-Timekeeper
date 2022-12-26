import 'package:flutter/material.dart';

class UIHelper {
  static List<BoxShadow> boxShadow({required Color color}) {
    return [BoxShadow(color: color, offset: const Offset(0, 4))];
  }

  static TextStyle textStyle({
    required Color fontColor,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontSize: 16,
      color: fontColor,
      fontWeight: fontWeight,
    );
  }

  static BoxDecoration boxDecoration(
      {required Color borderColor,
      required Color boxShadowColor,
      required Color backgroundColor}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: borderColor),
      boxShadow: boxShadow(color: boxShadowColor),
      color: backgroundColor,
    );
  }
}
