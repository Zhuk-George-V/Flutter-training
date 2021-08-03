import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function textFunction;
  const TextControl(this.textFunction);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        textFunction();
      },
      child: Text('Randomize the Text'),
    );
  }
}
