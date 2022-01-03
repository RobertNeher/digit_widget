import 'dart:async';

import 'multi_digit_display.dart';
// import 'digital_clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyDigitShow());
}

class MyDigitShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digit Widget Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DigitWidget(title: 'Flutter Digit'),
    );
  }
}

class DigitWidget extends StatefulWidget {
  DigitWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DigitWidgetState createState() => _DigitWidgetState();
}

class _DigitWidgetState extends State<DigitWidget> {
  late Timer tick;
  int number = 0;

/*
 This show case triggers a timer to show a counting number
*/
  @override
  void initState() {
    tick = Timer.periodic(Duration(milliseconds: 200), (Timer t) {
      setState(() {
        number++;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FittedBox(
          fit: BoxFit.fill,
          // Activating following line: Digital Clock (with the "Colon" separator)
          // child: digitalClock(context, DateTime.now(), height: 200)
          // ========
          // BuildContext context the widget runs in
          // DateTime time: The time to show (actually only 24h format, which will be made optional in future, including AM/PM indicator)
          // double height: maximal height of the digit
          // --------

          // // "Usual" application of the Digit widget.
          // child: multiDigitDisplay(context, number, height: 200, radix: 2, digitCount)
          // ========
          // The parameters are:
          // BuildContext context the widget runs in
          // int number: the number which has to be displayed
          // double height: maximal height of the digit (the height is adopted depending on width required by increasing number of single digits
          // int radix: defines the number space to be displayed, e.g.
          //    2 for binary numbers,
          //   10 for decimal numbers (with automatic support of thousand separator)
          //   16 for hexidecimal numbers
          // int digitCount: limits the number of
          child: multiDigitDisplay(context, number,
              height: 200, radix: 2, digitCount: 0),
        ));
  }
}
