import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final score;
  final VoidCallback restartApp;

  Result(this.score, this.restartApp);

  String get _yourResult {
    if (score < 10) {
      return 'you are an animal';
    } else if (score > 10) {
      return 'you are a human';
    } else {
      return 'I dont know who you are';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You did it!',
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
            ),
          ),
          Text(
            'your score:' + score.toString(),
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
            ),
          ),
          Text(
            _yourResult,
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
            ),
          ),
          TextButton(
            onPressed: restartApp,
            child: Text('Restart'),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
