class QuizEvent {}

class QuizStarted extends QuizEvent {}

class QuizNextQuestionStart extends QuizEvent {}

class QuizNextQuestionEnd extends QuizEvent {}

class QuizAnswered extends QuizEvent {
  final String questionId;
  final String selectedOptionId;

  QuizAnswered({required this.questionId, required this.selectedOptionId});
}
