import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final questionString;

  const Question(this.questionString);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        questionString,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontSize: 30),
      ),
    );
  }
}
