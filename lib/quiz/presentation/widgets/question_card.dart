import 'package:flutter/material.dart';
import 'package:quiz_application/quiz/domain/entity/option_entity.dart';
import 'package:quiz_application/quiz/domain/entity/question_entity.dart';

class QuestionCard extends StatelessWidget {
  final QuestionEntity question;
  final Function(OptionEntity)? onOptionSelected;
  const QuestionCard({
    super.key,
    required this.question,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      height: 300.0,
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.questionText,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                ...question.options.map((answer) {
                  return ListTile(
                    leading: Radio<String>(
                      value: answer.id,
                      groupValue: null,
                      onChanged: (value) {
                        onOptionSelected?.call(answer);
                      },
                    ),
                    title: Text(answer.optionText),
                    onTap: () {
                      onOptionSelected?.call(answer);
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
