import 'package:flutter/material.dart';
import 'digit.dart';

class DigitSpacer extends StatefulWidget {
  bool thousandGroup = true;
  bool decimalPoint = true;

  DigitSpacer({this.thousandGroup = false, this.decimalPoint = false});

  @override
  _DigitSpacerState createState() => _DigitSpacerState();
}

class _DigitSpacerState extends State<DigitSpacer> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: Digit.BAR_HEIGHT,
        width: Digit.BAR_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: widget.thousandGroup ? Digit.FOREGROUND : Digit.BACKGROUND,
        ),
      ),
      Container(
        height: Digit.BAR_HEIGHT * Digit.WIDTH_FACTOR,
        width: Digit.BAR_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: Digit.BACKGROUND,
        ),
      ),
      Container(
        height: Digit.BAR_HEIGHT,
        width: Digit.BAR_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: Digit.BACKGROUND,
        ),
      ),
      Container(
        height: Digit.BAR_HEIGHT * Digit.WIDTH_FACTOR,
        width: Digit.BAR_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: Digit.BACKGROUND,
        ),
      ),
      Container(
        height: Digit.BAR_HEIGHT,
        width: Digit.BAR_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: widget.decimalPoint ? Digit.FOREGROUND : Digit.BACKGROUND,
        ),
      ),
    ]);
  }
}
