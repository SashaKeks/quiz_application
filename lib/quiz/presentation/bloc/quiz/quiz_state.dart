import 'package:equatable/equatable.dart';
import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';

class QuizState extends Equatable {
  final QuizEntity? quiz;
  final int currentQuestionIndex;
  final bool isAnimated;
  final int correctAnswersCount;
  final Map<String, String> selectedOptionIds;

  const QuizState({
    this.quiz,
    this.currentQuestionIndex = 0,
    this.isAnimated = false,
    this.correctAnswersCount = 0,
    this.selectedOptionIds = const {},
  });

  QuizState copyWith({
    QuizEntity? Function()? quiz,
    int? currentQuestionIndex,
    bool? isAnimated,
    int? correctAnswersCount,
    Map<String, String>? selectedOptionIds,
  }) {
    return QuizState(
      quiz: quiz != null ? quiz() : this.quiz,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      isAnimated: isAnimated ?? this.isAnimated,
      correctAnswersCount: correctAnswersCount ?? this.correctAnswersCount,
      selectedOptionIds: selectedOptionIds ?? this.selectedOptionIds,
    );
  }

  @override
  List<Object?> get props => [
    quiz,
    isAnimated,
    correctAnswersCount,
    currentQuestionIndex,
  ];
}
