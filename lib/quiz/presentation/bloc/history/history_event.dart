import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';

class HistoryEvent {}

class HistoryGetEvent extends HistoryEvent {}

class HistoryNewDataSaveEvent extends HistoryEvent {
  final HistoryDataEntity historyData;

  HistoryNewDataSaveEvent({required this.historyData});
}

class HistorySaveEvent extends HistoryEvent {
  final String quizId;
  final String quizTitle;
  final int score;
  final int total;
  final int timestamp;

  HistorySaveEvent({
    required this.quizId,
    required this.quizTitle,
    required this.score,
    required this.total,
    required this.timestamp,
  });
}
