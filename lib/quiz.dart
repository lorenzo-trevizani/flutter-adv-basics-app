import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswer = [];
  var activeScreenName = 'start_screen';

  void switchScreen(String screenName, {bool reset = false}) {
    setState(() {
      activeScreenName = screenName;
      if (reset) {
        selectedAnswer.clear();
      }
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      switchScreen('result_screen');
    }
  }

  @override
  Widget build(context) {
    switch (activeScreenName) {
      case 'start_screen':
        activeScreen = StartScreen(switchScreen);
        selectedAnswer.clear();
        break;
      case 'question_screen':
        activeScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
        break;
      case 'result_screen':
        activeScreen = ResultsScreen(selectedAnswer, switchScreen);
        break;
      default:
        activeScreen = StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
