import 'package:quiz_application/quiz/domain/entity/option_entity.dart';

class QuestionEntity {
  final String id;
  final String questionText;
  final List<OptionEntity> options;
  final bool isAnswered;


  QuestionEntity({
    required this.id,
    required this.questionText,
    required this.options,
    required this.isAnswered,
  });
}