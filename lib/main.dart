import 'dart:async';

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
  Timer? everySecond;
  static String digitText = ' 0123456789ABCDEF-=_';
  int number = 0;

  void _nextDigit() {
    setState(() {
      number++;
      if (number >= digitText.length) {
        number = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        number++;

        if (number >= digitText.length) {
          number = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Digit(ValueNotifier<String>(digitText[number])),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: _nextDigit, child: const Icon(Icons.navigate_next))
        ]));
  }
}

//             Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Digit(' '),
//             Digit('0'),
//             Digit('1'),
//             Digit('2'),
//             Digit('3'),
//             Digit('4'),
//             Digit('5'),
//             Digit('6'),
//             Digit('7'),
//             Digit('8'),
//           ]),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Digit('9'),
//             Digit('A'),
//             Digit('B'),
//             Digit('C'),
//             Digit('D'),
//             Digit('E'),
//             Digit('F'),
//             Digit('-'),
//             Digit('='),
//             Digit('_'),
//           ])
//         ]));
//   }
// }
