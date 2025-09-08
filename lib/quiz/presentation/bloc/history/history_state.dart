import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';

class HistoryState {
  final List<HistoryDataEntity> history;

  HistoryState({required this.history});

  HistoryState copyWith({List<HistoryDataEntity>? history}) {
    return HistoryState(
      history: history ?? this.history,
    );
  }
}
