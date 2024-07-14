import 'package:flutter/material.dart';
import 'package:adv_basics/Texts/quiz_main_title.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          const QuizMainTitle('Learn Flutter the fun way!'),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Start Quiz',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt_rounded),
          ),
        ],
      ),
    );
  }
}
