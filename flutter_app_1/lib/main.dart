import 'package:flutter/material.dart';

import 'package:flutter_app_1/quiz.dart';
import 'package:flutter_app_1/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionsInd = 0;
  var _totalScore = 0;
  var questions = [
    {
      'question': 'what are you?',
      'answers': [
        {'text': 'dog', 'score': 3},
        {'text': 'cat', 'score': 3},
        {'text': 'human', 'score': 10}
      ],
    },
    {
      'question': 'where are you?',
      'answers': [
        {'text': 'home', 'score': 10},
        {'text': 'in forest', 'score': 3},
        {'text': 'somwhere outside', 'score': 3}
      ],
    },
    {
      'question': 'LOL?',
      'answers': [
        {'text': 'what do you mean?', 'score': 10},
        {'text': 'bark....', 'score': 3},
        {'text': 'meu....', 'score': 3}
      ],
    },
  ];
  void _restartApp() {
    setState(() {
      _totalScore = 0;
      _questionsInd = 0;
    });
  }

  void _answerQuestions(int score) {
    print(_questionsInd);
    setState(() {
      _totalScore += score;
      _questionsInd += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello world!!'),
        ),
        body: (_questionsInd < questions.length)
            ? Quiz(
                questions: questions,
                questionsInd: _questionsInd,
                answerQuestions: _answerQuestions)
            : Result(_totalScore, _restartApp),
      ),
    );
  }
}
