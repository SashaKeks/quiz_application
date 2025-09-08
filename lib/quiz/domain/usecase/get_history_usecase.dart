import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';
import 'package:quiz_application/quiz/domain/repository/history_repository.dart';

class GetHistoryUseCase {
  final HistoryRepository repository;
  GetHistoryUseCase(this.repository);


  Future<List<HistoryDataEntity>> call() {
    return repository.getHistory();
  }
}