import 'package:flutter/material.dart';

const double BAR_HEIGHT = 70.0;
const Color FOREGROUND = Colors.blueGrey;
const Color BACKGROUND = Colors.transparent;
const double BODY_HEIGHT_FACTOR = 0.35;
const double BODY_WIDTH_FACTOR = 0.5;
const double BAR_HEIGHT_FACTOR = 0.1;
const String DECIMAL_POINT = '.';

class Digit extends StatefulWidget {
  ValueNotifier number = ValueNotifier<String>('0');
  late BuildContext context;
  double height = 0;
  late Color foreGroundColor;
  late Color backGroundColor;
  late double barRadius = 0;

  Digit(String _number, BuildContext context,
      {double height = BAR_HEIGHT,
      Color foreGroundColor = FOREGROUND,
      Color backGroundColor = BACKGROUND,
      double barRadius = 0}) {
    this.context = context;
    this.number.value = _number.toUpperCase()[_number.length - 1];
    this.height = height;
    this.foreGroundColor = foreGroundColor;
    this.backGroundColor = backGroundColor;
    this.barRadius = height / 35;
  }

/* ###0###    - Bar
  #       #
  #       #
  1       2   - Body
  #       #
  #       #
   ###3###    - Bar
  #       #
  #       #
  4       5   - Body
  #       #
  #       #
   ###6###    - Bar
*/
  static Map<String, List<bool>> digitBars = {
    /*      0       1      2      3       4      5     6*/
    ' ': [false, false, false, false, false, false, false], // all off
    '0': [true, true, true, false, true, true, true],
    '1': [false, false, true, false, false, true, false],
    '2': [true, false, true, true, true, false, true],
    '3': [true, false, true, true, false, true, true],
    '4': [false, true, true, true, false, true, false],
    '5': [true, true, false, true, false, true, true],
    '6': [true, true, false, true, true, true, true],
    '7': [true, false, true, false, false, true, false],
    '8': [true, true, true, true, true, true, true],
    '9': [true, true, true, true, false, true, true],
    'A': [true, true, true, true, true, true, false],
    'B': [false, true, false, true, true, true, true],
    'C': [true, true, false, false, true, false, true],
    'D': [false, false, true, true, true, true, true],
    'E': [true, true, false, true, true, false, true],
    'F': [true, true, false, true, true, false, false],
    '-': [false, false, false, true, false, false, false],
    '=': [true, false, false, true, false, false, false],
    '_': [false, false, false, false, false, false, true],
    'X': [false, true, true, true, true, true, false], // in fact it is an "H"
  };

  @override
  createState() => DigitState();
}

class DigitState extends State<Digit> {
  List<bool>? opacity = <bool>[];
  RegExp hexNumberSpace = RegExp(r'^[A-Fa-f0-9]+$');

  @override
  void initState() {
    if (!hexNumberSpace.hasMatch(widget.number.value)) {
      opacity = Digit.digitBars[widget.number.value];
    } else {
      opacity = Digit.digitBars[' '];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.number,
        builder: (context, value, child) {
          print('$value: $opacity');
          opacity = Digit.digitBars[value];
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Bar(opacity![0], widget.height),
            Body(opacity![1], opacity![2], widget.height),
            Bar(opacity![3], widget.height),
            Body(opacity![4], opacity![5], widget.height),
            Bar(opacity![6], widget.height),
          ]);
        });
  }

  Widget Bar(bool opacity, double height) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: widget.height * BAR_HEIGHT_FACTOR,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.height * BAR_HEIGHT_FACTOR,
        width: widget.height * BODY_WIDTH_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: opacity ? widget.foreGroundColor : widget.backGroundColor,
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

  Widget Body(bool opacityLeft, bool opacityRight, double height) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: widget.height * BODY_HEIGHT_FACTOR,
        width: widget.height * BAR_HEIGHT_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.barRadius),
          color: opacityLeft ? widget.foreGroundColor : widget.backGroundColor,
        ),
      ),
      Container(
        height: widget.height * BODY_HEIGHT_FACTOR,
        width: widget.height * BODY_WIDTH_FACTOR,
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
          color: opacityRight ? widget.foreGroundColor : widget.backGroundColor,
        ),
      )
    ]);
  }
}
