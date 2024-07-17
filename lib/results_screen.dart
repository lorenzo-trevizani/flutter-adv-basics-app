import 'package:flutter/material.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswer, {super.key});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summaryData.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'chosen_answer': chosenAnswer[i],
        },
      );
    }

    return summaryData;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final int numberTotalQuestions = questions.length;
    final int numberCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['chosen_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You answered $numberCorrectQuestions out of $numberTotalQuestions questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              TextButton(
                onPressed: () {},
                child: const Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
