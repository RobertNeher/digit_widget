import 'package:flutter/material.dart';
import 'digit.dart';
import 'separator.dart';

/// Displays digits according to given radix and height
/// Colors are pre-defined.
/// The number of digits is unlimited by default (digitCount == 0)
/// if digit count is a number greater zero, the width of the display may be limited.
Widget multiDigitDisplay(BuildContext context, double number,
    {double height = 50, int radix = 10, int digitCount = 0}) {
  String _number = number.toString();
  String _intPart = '', _fractPart = '', dp = '';

  if (radix == 10) {
    if (_number.contains('.')) {
      dp = '.';
    }
    if (_number.contains(',')) {
      dp = ',';
    }

    if (dp.isNotEmpty) {
      _intPart = _number.split(dp)[0];
      _fractPart = _number.split(dp)[1];
    } else {
      _intPart = number.toInt().toRadixString(radix).toUpperCase();
    }
  }

  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: getDigits(
            context, _intPart, _fractPart, height, radix, digitCount)),
  );
}

List<Widget> getDigits(BuildContext context, String intPart, String fractPart,
    double height, int radix, int digitCount) {
  List<Widget> digitRow = <Widget>[];

  // now the integer part itself, includes minus sign of negative number given
  for (int i = 0; i < ((digitCount == 0) ? intPart.length : digitCount); i++) {
    digitRow.add(
      Digit(
        intPart[i],
        context,
        height: height,
      ),
    );
  }

  // Thousands grouping, if decimal numbers are expected
  if (radix == 10) {
    for (int i = digitRow.length - 3; i > 0; i -= 3) {
      digitRow.insert(
          i,
          Separator(
            context,
            height: height,
            thousandGroup: true,
          ));
    }
  }

  // now the fraction part itself (if any),  collection starts after '0.' of fraction part
  // if (fractPart.isNotEmpty) {
  digitRow.add(Separator(context,
      height: height,
      thousandGroup: false,
      decimalPoint: true,
      foreGroundColor: FOREGROUND,
      backGroundColor: BACKGROUND));

  for (int i = 0; i < fractPart.length; i++) {
    digitRow.add(
      Digit(
        fractPart[i],
        context,
        height: height,
      ),
    );
    // }
  }

  // add distance between digits for readability
  for (int i = digitRow.length - 1; i >= 1; i--) {
    if (digitRow[i] is Digit) {
      digitRow.insert(i, Separator(context, height: height));
    }
  }
  return digitRow;
}
