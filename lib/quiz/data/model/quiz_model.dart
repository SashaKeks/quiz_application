import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';

class QuizModel extends QuizEntity {
  /// Creates a new instance of [QuizModel]. That help combine question in one quiz
  QuizModel({required super.id, required super.name, required super.questions});
}
