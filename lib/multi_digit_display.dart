import 'package:flutter/material.dart';
import 'digit.dart';
import 'digit_spacer.dart';

// if digitCount == 0, digit count is unlimited, if digitCount > 0 otherwise
Widget multiDigitDisplay(BuildContext context, int number,
    {double height = 50, int radix = 10, int digitCount = 0}) {
  String _number = number.toRadixString(radix).toUpperCase();

  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: getDigits(context, _number, height, radix, digitCount)),
  );
}

List<Widget> getDigits(BuildContext context, String number, double height,
    int radix, int digitCount) {
  bool negativeNumber = (radix == 10 && int.parse(number) < 0);
  int displaySize = 0;
  List<Widget> digitRow = <Widget>[];

  displaySize = digitCount == 0 ? number.length : digitCount;

  // now the number itself
  for (int i = negativeNumber ? 1 : 0; i < displaySize; i++) {
    digitRow.add(
      Digit(
        number[i],
        context,
        height: height,
      ),
    );
  }

  if (radix == 10) {
    for (int i = digitRow.length - 3; i > 0; i -= 3) {
      if (i != 3) {
        digitRow.insert(
            i,
            DigitSpacer(
              context,
              height: height,
              thousandGroup: true,
            ));
      }
    }
  }
  // prefix '-' if negative number
  if (negativeNumber) {
    digitRow.insert(0, Digit('-', context, height: height));
  }

  // add distance between digits
  for (int i = digitRow.length - 1; i >= 1; i--) {
    if (digitRow[i] is Digit) {
      digitRow.insert(i, DigitSpacer(context, height: height));
    }
  }
  return digitRow;
}
