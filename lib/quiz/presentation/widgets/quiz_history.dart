import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_state.dart';

class QuizHistory extends StatelessWidget {
  const QuizHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HistoryBloc, HistoryState, List<HistoryDataEntity>>(
      selector: (state) => state.history,
      builder: (context, history) {
        return ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            final formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(
              DateTime.fromMillisecondsSinceEpoch(history[index].timestamp),
            );
            return ListTile(
              title: Text(history[index].quizTitle),
              subtitle: Text(
                "Score: ${history[index].score} / ${history[index].total}",
              ),
              trailing: Text(formattedDate),
            );
          },
        );
      },
    );
  }
}
