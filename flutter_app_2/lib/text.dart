import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final _index;

  const MyText(this._index);

  static const _allText = [
    'lol1',
    'lol2',
    'lol3',
  ];

  @override
  Widget build(BuildContext context) {
    return Text(
      _allText[_index],
      style: TextStyle(fontSize: 30, color: Colors.blue),
    );
  }
}
