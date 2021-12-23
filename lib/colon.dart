import 'package:flutter/material.dart';
import 'digit.dart';

///
/// thousandGroup For grouping of thouesands
/// decimalPoint For decimal point
/// both enabled represent a colon
class Colon extends StatefulWidget {
  late BuildContext context;
  late double height;
  late double barRadius;
  late Color foreGroundColor;
  late Color backGroundColor;

  Colon(
    BuildContext context, {
    double height = 100,
    Color foreGroundColor = FOREGROUND,
    Color backGroundColor = BACKGROUND,
  }) {
    this.context = context;
    this.height = height;
    this.barRadius = height / 35;
    this.backGroundColor = backGroundColor;
    this.foreGroundColor = foreGroundColor;
  }

  @override
  _ColonState createState() => _ColonState();
}

class _ColonState extends State<Colon> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: widget.height * 4 / 15,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.barRadius),
            color: widget.backGroundColor),
      ),
      Container(
        height: widget.height * 1 / 15,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.barRadius),
            color: widget.foreGroundColor),
      ),
      Container(
        height: widget.height * 3 / 15,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.height * 1 / 15,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.foreGroundColor,
        ),
      ),
      Container(
        height: widget.height * 4 / 15,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.height * BAR_HEIGHT_FACTOR,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.backGroundColor,
        ),
      ),
    ]);
  }
}
