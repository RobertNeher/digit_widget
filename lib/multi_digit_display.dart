import 'package:flutter/material.dart';
import 'digit.dart';
import 'digit_spacer.dart';

Widget multiDigitDisplay(int number, {int radix = 10}) {
  String _number = number.toRadixString(radix).toUpperCase();
  final int displaySize = _number.length - 1;

  return Container(
      // padding: const EdgeInsets.all(8.0),
      child: Row(
    children: getDigits(_number),
  ));
}

List<Widget> getDigits(String number) {
  final int displaySize = number.length - 1;
  List<Widget> digitRow = <Widget>[];
  RegExp all = RegExp(r'^[0-9A-F]*$');
  RegExp onlyNumbers = RegExp(r'^[0-9]*$');
  // minus symbol for negative numbers
  if (onlyNumbers.hasMatch(number) && int.tryParse(number)! < 0) {
    digitRow.add(Digit('-'));
  }

  for (int i = 0; i <= displaySize; i++) {
    digitRow.add(Digit(number[i]));
    digitRow.add(DigitSpacer());
  }

  for (int i = digitRow.length; i >= 2; i--) {
    if (i > 3 && i % 3 == 0) {
      digitRow.insert(
          i,
          DigitSpacer(
            thousandGroup: true,
          ));
    }
  }

  return digitRow;
}
