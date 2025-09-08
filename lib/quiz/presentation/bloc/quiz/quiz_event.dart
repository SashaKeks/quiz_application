import 'package:quiz_application/quiz/domain/entity/option_entity.dart';

class QuizEvent {}

class QuizStarted extends QuizEvent {}

class QuizNextQuestionStart extends QuizEvent {}

class QuizNextQuestionEnd extends QuizEvent {}

class QuizAnswered extends QuizEvent {
  final String questionId;
  final OptionEntity selectedOption;

  QuizAnswered({required this.questionId, required this.selectedOption});
}
