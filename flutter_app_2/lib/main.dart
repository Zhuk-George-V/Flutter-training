import 'package:flutter/material.dart';

import './text_control.dart';
import './text.dart';
main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  void _changeText() {
    setState(() {
      _index += 1;
      print(_index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Text Randomizer App'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(_index),
              TextControl(_changeText),
            ],
          ),
        ),
      ),
    );
  }
}
