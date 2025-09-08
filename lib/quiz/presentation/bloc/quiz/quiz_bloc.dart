import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/quiz/domain/usecase/get_quiz_usecase.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_event.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuizUseCase getQuizUseCase;

  QuizBloc(this.getQuizUseCase) : super(const QuizState()) {
    on<QuizStarted>((event, emit) async {
      final result = await getQuizUseCase();
      emit(
        state.copyWith(
          correctAnswersCount: 0,
          currentQuestionIndex: 0,
          isAnimated: false,
          quiz: () => result,
        ),
      );
    });

    on<QuizAnswered>((event, emit) {
      Map<String, String> currentSelections = Map.from(state.selectedOptionIds);
      currentSelections[event.questionId] = event.selectedOption.id;

      emit(
        state.copyWith(
          selectedOptionIds: currentSelections,
          correctAnswersCount:
              state.correctAnswersCount +
              (event.selectedOption.isCorrect ? 1 : 0),
        ),
      );
    });

    on<QuizNextQuestionStart>((event, emit) {
      emit(state.copyWith(isAnimated: true));
    });
    on<QuizNextQuestionEnd>((event, emit) {
      emit(
        state.copyWith(
          isAnimated: false,
          currentQuestionIndex: state.currentQuestionIndex + 1,
        ),
      );
    });
  }
}
