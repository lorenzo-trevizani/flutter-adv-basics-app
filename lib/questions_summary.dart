import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    const correctColor = Color.fromARGB(255, 56, 164, 60);
    const wrongColor = Color.fromARGB(255, 152, 52, 56);

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: data['correct_answer'] == data['chosen_answer']
                        ? correctColor
                        : wrongColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['chosen_answer'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          color: wrongColor,
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          color: correctColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
