import 'dart:async';

import 'package:digit_widget/multi_digit_display.dart';
import 'digital_clock.dart';
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
      home: MyHomePage(title: 'Flutter Digit Show'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer tick;
  int number = 0;

  @override
  void initState() {
    tick = Timer.periodic(Duration(minutes: 1), (Timer t) {
      setState(() {
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
            child: digitalClock(context, DateTime.now(), height: 200)
            // child: multiDigitDisplay(context, number,
            //     height: 100, radix: 10, digitCount: 0),
            )
    );
  }
}
