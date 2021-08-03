import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              // flex: 2,
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                color: Colors.blue,
                child: Text('data1'),
              ),
            ),
            Flexible(
              child: SizedBox(),
              // flex: 1,
            ),
            Flexible(
              // flex: 2,
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                color: Colors.red,
                child: Text('data2'),
              ),
            ),
            Flexible(
              child: SizedBox(),
              // flex: 1,
            ),
            Flexible(
              // flex: 0,
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                color: Colors.yellow,
                child: Text('data2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
