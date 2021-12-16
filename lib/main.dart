import 'dart:async';
import 'dart:math';

import 'package:digit_widget/digit_spacer.dart';
import 'package:digit_widget/multi_digit_display.dart';
import 'package:flutter/material.dart';

import 'digit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Digit'),
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
  int number = 800;

  @override
  void initState() {
    Random randomInt = Random();
    tick = Timer.periodic(Duration(milliseconds: 75), (Timer t) {
      setState(() {
        number++; // = randomInt.nextInt(10000);
      });
    });

    super.initState();

    setState(() {
      number = 950;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(children: [
        Text(
          number.toRadixString(10),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        Spacer(),
        multiDigitDisplay(number, radix: 10),
      ]),
    );
  }
}
