import 'package:quiz_application/quiz/data/datasource/history_local_datasource/history_datasource_interface.dart';
import 'package:quiz_application/quiz/data/model/history_data_model.dart';
import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';
import 'package:quiz_application/quiz/domain/repository/history_repository.dart';

class HistoryService implements HistoryRepository {
  final HistoryDatasourceInterface _historyDatasource;

  HistoryService(this._historyDatasource);

  @override
  Future<List<HistoryDataEntity>> getHistory() {
    return _historyDatasource.getHistory();
  }

  @override
  Future<void> saveHistory(HistoryDataEntity historyData) {
    return _historyDatasource.saveHistory(
      HistoryDataModel.fromEntity(historyData),
    );
  }
}
