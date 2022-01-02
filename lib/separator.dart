import 'package:flutter/material.dart';
import 'digit.dart';

///
/// thousandGroup For grouping of thouesands
/// decimalPoint For decimal point
/// both enabled represent a colon
class Separator extends StatefulWidget {
  late BuildContext context;
  late bool thousandGroup;
  late bool decimalPoint;
  late double height;
  late double barRadius;
  late Color foreGroundColor;
  late Color backGroundColor;

  Separator(
    BuildContext context, {
    double height = 100,
    bool thousandGroup = false,
    bool decimalPoint = false,
    Color foreGroundColor = FOREGROUND,
    Color backGroundColor = BACKGROUND,
  }) {
    this.context = context;
    this.thousandGroup = thousandGroup;
    this.decimalPoint = decimalPoint;
    this.height = height;
    this.barRadius = height / 35;
    this.backGroundColor = backGroundColor;
    this.foreGroundColor = foreGroundColor;
  }

  @override
  _SeparatorState createState() => _SeparatorState();
}

class _SeparatorState extends State<Separator> {
  late Size size;

  @override
  void initState() {
    // size = MediaQuery.of(widget.context).size;
    // widget.height = height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: widget.height * BAR_HEIGHT_FACTOR,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.thousandGroup
              ? widget.foreGroundColor
              : widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.height * BODY_HEIGHT_FACTOR,
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
      Container(
        height: widget.height * BODY_HEIGHT_FACTOR,
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
          color: widget.decimalPoint
              ? widget.foreGroundColor
              : widget.backGroundColor,
        ),
      ),
    ]);
  }
}
