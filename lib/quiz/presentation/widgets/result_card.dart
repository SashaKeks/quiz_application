import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_event.dart';

class ResultCard extends StatelessWidget {
  final int correct;
  final int total;
  const ResultCard({super.key, this.correct = 0, this.total = 0});

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
                  context.read<QuizBloc>().add(QuizStarted());
                },
                child: Text(
                  "Restart Quiz",
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
