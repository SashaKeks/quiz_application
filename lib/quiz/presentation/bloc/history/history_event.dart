import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';

class HistoryEvent {}

class HistoryGetEvent extends HistoryEvent {}

class HistoryNewDataSaveEvent extends HistoryEvent {
  final HistoryDataEntity historyData;

  HistoryNewDataSaveEvent({required this.historyData});
}

class HistorySaveEvent extends HistoryEvent {
  final String quizId;
  final int score;

  HistorySaveEvent({required this.quizId, required this.score});
}