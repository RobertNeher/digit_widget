import 'package:flutter/material.dart';
import 'digit.dart';
import 'digit_spacer.dart';

Widget multiDigitDisplay(BuildContext context, int number, double height,
    {int radix = 10, int digitCount = 5, bool dynamicRange = false}) {
  String _number = number.toRadixString(radix).toUpperCase();

  return Container(
      // padding: const EdgeInsets.all(8.0),
    child: Row(
        children: getDigits(
            context, _number, height, radix, digitCount, dynamicRange)),
  );
}

List<Widget> getDigits(BuildContext context, String number, double height,
    int radix,
    int digitCount, bool dynamicRange) {
  int displaySize;
  bool negativeNumber = (int.tryParse(number)! < 0 && radix == 10);
  List<Widget> digitRow = <Widget>[];

  displaySize = (dynamicRange && digitCount < number.length)
      ? digitCount - 1
      : number.length - 1;

  // sign for negative number of radix 10
  if (negativeNumber) {
    digitRow.add(Digit(
      '-',
      context,
      height: height,
    ));
    digitRow.add(DigitSpacer(context));
  }

  // now the number itself
  for (int i = 0; i < displaySize + (negativeNumber ? 0 : 1); i++) {
    digitRow.add(Digit(
      number[i],
      context,
      height: height,
    ));
    digitRow.add(DigitSpacer(
      context,
      height: height,
    ));
  }

  // skip first spacer on most left side off digit row
  for (int i = digitRow.length; i >= 0; i = i - 7) {
    if (i - 7 > 0) {
      digitRow[i - 7] = DigitSpacer(
        context,
        thousandGroup: true,
        height: height,
      );
    }
  }
  return digitRow;
}
