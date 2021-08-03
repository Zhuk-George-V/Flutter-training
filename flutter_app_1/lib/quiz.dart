import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final questions;
  final questionsInd;
  final Function answerQuestions;

  const Quiz(
      {required this.questions,
      required this.questionsInd,
      required this.answerQuestions});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Question(
            questions[questionsInd]['question'],
          ),
          ...(questions[questionsInd]['answers'] as List<Map<String, Object>>)
              .map((a) {
            return Answer(() => answerQuestions(a['score']), a['text']);
          }).toList()
        ],
      ),
    );
  }
}
