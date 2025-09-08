import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';
import 'package:quiz_application/quiz/domain/repository/quiz_repository.dart';

class GetQuizUseCase {
  final QuizRepository repository;
  GetQuizUseCase(this.repository);


  Future<QuizEntity> call() {
    return repository.getQuiz();
  }
}