import 'package:quiz_application/quiz/data/datasource/quiz_local_datasource/quiz_datasource_interface.dart';
import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';
import 'package:quiz_application/quiz/domain/repository/quiz_repository.dart';

class QuizService implements QuizRepository {
  final QuizDatasourceInterface datasource;
  QuizService(this.datasource);
  @override
  Future<QuizEntity> getQuiz() {
    return datasource.getQuiz();
  }
}
