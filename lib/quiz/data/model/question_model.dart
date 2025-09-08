import 'package:quiz_application/quiz/domain/entity/question_entity.dart';

class QuestionModel extends QuestionEntity{
  /// Creates a new instance of [QuestionModel]. With diff options 
  QuestionModel({required super.id, required super.questionText, required super.options});
}