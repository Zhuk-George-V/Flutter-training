import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerF;
  final answerT;

  const Answer(this.answerF, this.answerT);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(answerT),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 40))),
      onPressed: answerF,
    );
  }
}
