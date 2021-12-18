import 'package:flutter/material.dart';
import 'digit.dart';
import 'digit_spacer.dart';

Widget multiDigitDisplay(int number,
    {int radix = 10, int digitCount = 2, bool dynamicRange = false}) {
  String _number = number.toRadixString(radix).toUpperCase();

  return Container(
      // padding: const EdgeInsets.all(8.0),
      child: Row(
    children: getDigits(_number, radix, digitCount, dynamicRange),
  ));
}

List<Widget> getDigits(
    String number, int radix, int digitCount, bool dynamicRange) {
  int displaySize;
  bool negativeNumber = (int.tryParse(number)! < 0 && radix == 10);
  List<Widget> digitRow = <Widget>[];

  displaySize = (dynamicRange && digitCount < number.length)
      ? digitCount - 1
      : number.length - 1;

  // minus symbol for negative numbers of radix 10
  if (negativeNumber) {
    digitRow.add(Digit('-'));
  }
  // now the numbeere itself
  for (int i = negativeNumber ? 1 : 0; i <= displaySize; i++) {
    digitRow.add(Digit(number[i]));
    digitRow.add(DigitSpacer());
  }

  // for (int i = digitRow.length; i >= 2; i--) {
  //   if (i > 3 && i % 3 == 0) {
  //     digitRow.insert(
  //         i,
  //         DigitSpacer(
  //           thousandGroup: true,
  //         ));
  //   }
  // }

  return digitRow;
}
