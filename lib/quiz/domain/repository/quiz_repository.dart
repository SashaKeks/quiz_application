import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';

abstract class QuizRepository{
  Future<QuizEntity> getQuiz();
}