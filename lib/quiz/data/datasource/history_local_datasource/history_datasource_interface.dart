import 'package:quiz_application/quiz/data/model/history_data_model.dart';

abstract class HistoryDatasourceInterface {
  Future<List<HistoryDataModel>> getHistory();
  Future<void> saveHistory(HistoryDataModel historyData);
}