import 'package:quiz_application/quiz/domain/entity/question_entity.dart';

class QuizEntity {
  /// Creates a new instance of [QuizEntity]. That help combine question in one quiz
  final String id;
  final String name;
  final List<QuestionEntity> questions;

  QuizEntity({
    required this.id,
    required this.name,
    required this.questions,
  });
}
