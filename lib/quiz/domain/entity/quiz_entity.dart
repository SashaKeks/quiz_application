import 'package:quiz_application/quiz/domain/entity/question_entity.dart';

class QuizEntity {
  final String id;
  final String name;
  final List<QuestionEntity> questions;
  final int correctAnswersCount;

  QuizEntity({
    required this.id,
    required this.name,
    required this.questions,
    required this.correctAnswersCount,
  });
}
