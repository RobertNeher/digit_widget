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
      title: 'Digit Show',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DigitWidget(title: 'Flutter Digit Demo Case'),
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
  // late Timer tick;
  double number = -1234.56;

  @override
  void initState() {
    // tick = Timer.periodic(Duration(milliseconds: 1), (Timer t) {
    //   setState(() {
    //     number += 1;
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
        ),
        body: FittedBox(
          fit: BoxFit.fill,
          // child: digitalClock(context, DateTime.now(), height: 200)
          child: multiDigitDisplay(context, number,
              height: 200, radix: 10, digitCount: 0),
        ));
  }
}
