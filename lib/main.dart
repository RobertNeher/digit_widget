import 'dart:async';
import 'dart:math';

import 'package:digit_widget/multi_digit_display.dart';
// import 'package:digit_widget/digit.dart';
import 'package:flutter/material.dart';

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
  int number = 0;

  @override
  void initState() {
    Random randomInt = Random();
    tick = Timer.periodic(Duration(milliseconds: 1), (Timer t) {
      setState(() {
        number++;
      });
    });

    super.initState();

    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        // Digit(number.toRadixString(10), height:20, foreGroundColor: Colors.amber, backGroundColor: Colors.grey,),
          multiDigitDisplay(number, context, radix: 10),
    );
  }
}
