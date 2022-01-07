import 'package:digit_widget/separator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'colon.dart';
import 'digit.dart';

// if digitCount == 0, digit count is unlimited, if digitCount > 0 otherwise
Widget digitalClock(BuildContext context, DateTime time, {double height = 50}) {
  DateFormat df = DateFormat('HH:mm:ss');
  String _timeString = df.format(time);

  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: getDigits(context, _timeString, height)),
  );
}

List<Widget> getDigits(BuildContext context, String timeString, height) {
  List<Widget> digitRow = <Widget>[];

  for (int i = 0; i < timeString.length; i++) {
    if (timeString[i] == ':') {
      digitRow.add(Colon(context, height: height));
    } else {
      digitRow.add(Digit(timeString[i], context, height: height));
    }
    digitRow.add(Separator(
      context,
      height: height,
    ));
  }
  digitRow.removeLast();
  return digitRow;
}
//   // add distance between digits
//   for (int i = digitRow.length - 1; i >= 1; i--) {
//     if (digitRow[i] is Digit) {
//       digitRow.insert(i, Separator(context, height: height));
//     }
//   }
//   return digitRow;
// }
