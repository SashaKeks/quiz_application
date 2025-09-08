import 'package:quiz_application/quiz/domain/entity/option_entity.dart';

class QuestionEntity {
  /// Creates a new instance of [QuestionEntity]. With diff options
  final String id;
  final String questionText;
  final List<OptionEntity> options;


  QuestionEntity({
    required this.id,
    required this.questionText,
    required this.options,
  });

}