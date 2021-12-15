import 'package:flutter/material.dart';

class Digit extends StatefulWidget {
  ValueNotifier digit = ValueNotifier<String>('0');

  Digit(this.digit);

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
  };

  static double BAR_HEIGHT = 30.0;
  static double WIDTH_FACTOR = 4.0;
  static double BAR_RADIUS = 8.0;
  static Color FOREGROUND = Colors.red;
  static Color BACKGROUND = Colors.grey;

  @override
  createState() => DigitState();
}

class DigitState extends State<Digit> {
  List<bool>? opacity = <bool>[];

  @override
  void initState() {
    opacity = Digit.digitBars[widget.digit];
    // print('Init Digit: ${widget.digit}: $opacity');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.digit,
        builder: (context, value, child) {
          opacity = Digit.digitBars[value];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Bar(opacity![0]),
              Body(opacity![1], opacity![2]),
              Bar(opacity![3]),
              Body(opacity![4], opacity![5]),
              Bar(opacity![6]),
            ],
          );
        });
  }

  Widget Bar(bool opacity) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: Digit.BAR_HEIGHT,
        width: Digit.BAR_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: Digit.BACKGROUND,
        ),
      ),
      Container(
        height: Digit.BAR_HEIGHT,
        width: Digit.BAR_HEIGHT * Digit.WIDTH_FACTOR,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: opacity ? Digit.FOREGROUND : Digit.BACKGROUND,
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
    ]);
  }

  Widget Body(bool opacityLeft, bool opacityRight) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: Digit.BAR_HEIGHT * Digit.WIDTH_FACTOR,
        width: Digit.BAR_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Digit.BAR_RADIUS),
          color: opacityLeft ? Digit.FOREGROUND : Digit.BACKGROUND,
        ),
      ),
      Container(
        height: Digit.BAR_HEIGHT * Digit.WIDTH_FACTOR,
        width: Digit.BAR_HEIGHT * Digit.WIDTH_FACTOR,
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
          color: opacityRight ? Digit.FOREGROUND : Digit.BACKGROUND,
        ),
      ),
    ]);
  }
}
