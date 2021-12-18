import 'package:flutter/material.dart';
import 'digit.dart';

class DigitSpacer extends StatefulWidget {
  late bool thousandGroup;
  late bool decimalPoint;
  late double digitHeight;
  late double barRadius;
  late Color foreGroundColor;
  late Color backGroundColor;

  DigitSpacer({
    double height = BAR_HEIGHT,
    bool thousandGroup = false,
    bool decimalPoint = false,
    Color foreGroundColor = FOREGROUND,
    Color backGroundColor = BACKGROUND,
  }) {
    this.thousandGroup = false;
    this.decimalPoint = false;
    this.digitHeight = height / 3;
    this.barRadius = height / 12;
    this.backGroundColor = backGroundColor;
    this.foreGroundColor = foreGroundColor;
  }

  @override
  _DigitSpacerState createState() => _DigitSpacerState();
}

class _DigitSpacerState extends State<DigitSpacer> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: widget.digitHeight,
        width: widget.digitHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.thousandGroup
              ? widget.foreGroundColor
              : widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.digitHeight * WIDTH_FACTOR,
        width: widget.digitHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.digitHeight,
        width: widget.digitHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.digitHeight * WIDTH_FACTOR,
        width: widget.digitHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.digitHeight,
        width: widget.digitHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.decimalPoint
              ? widget.foreGroundColor
              : widget.backGroundColor,
        ),
      ),
    ]);
  }
}
