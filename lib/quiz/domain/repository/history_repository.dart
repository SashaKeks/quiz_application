import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';

abstract class HistoryRepository {
  Future<List<HistoryDataEntity>> getHistory();
  Future<void> saveHistory(HistoryDataEntity historyData);
}