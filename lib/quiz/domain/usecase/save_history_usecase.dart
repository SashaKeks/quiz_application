import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';
import 'package:quiz_application/quiz/domain/repository/history_repository.dart';

class SaveHistoryUseCase {
  final HistoryRepository repository;
  SaveHistoryUseCase(this.repository);


  Future<void> call(HistoryDataEntity historyData) {
    return repository.saveHistory(historyData);
  }
}