import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_event.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_event.dart';

class ResultCard extends StatelessWidget {
  final QuizEntity? quiz;
  final int correct;
  final int total;
  const ResultCard({
    super.key,
    required this.quiz,
    this.correct = 0,
    this.total = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: Card(
        child: Center(
          child: Column(
            spacing: 16.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Quiz Completed!", style: TextStyle(fontSize: 24)),
              Text("Score: $correct/$total", style: TextStyle(fontSize: 20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (quiz == null) return;
                  context.read<HistoryBloc>().add(
                    HistorySaveEvent(
                      quizId: quiz!.id,
                      quizTitle: quiz!.name,
                      score: correct,
                      total: total,
                      timestamp: DateTime.now().millisecondsSinceEpoch,
                    ),
                  );
                  context.read<QuizBloc>().add(QuizStarted());
                },
                child: Text(
                  "Save & Restart Quiz",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
