import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/quiz/domain/entity/option_entity.dart';
import 'package:quiz_application/quiz/domain/entity/question_entity.dart';
import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_event.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(const QuizState()) {
    on<QuizStarted>((event, emit) {
      emit(
        state.copyWith(
          quiz:
              () => QuizEntity(
                id: "Quiz-1",
                name: "Sasha",
                questions: [
                  QuestionEntity(
                    id: "1",
                    questionText: "What is Flutter mainly used for?",
                    options: [
                      OptionEntity(
                        id: "1.1",
                        optionText: "Cross-platform UI development",
                        isCorrect: true,
                      ),
                      OptionEntity(id: "1.2", optionText: "Backend services"),
                      OptionEntity(
                        id: "1.3",
                        optionText: "Database management",
                      ),
                    ],
                  ),
                  QuestionEntity(
                    id: "2",
                    questionText: "Which language is Flutter written in?",
                    options: [
                      OptionEntity(
                        id: "2.1",
                        optionText: "Dart",
                        isCorrect: true,
                      ),
                      OptionEntity(id: "2.2", optionText: "Java"),
                      OptionEntity(id: "2.3", optionText: "Swift"),
                    ],
                  ),
                  QuestionEntity(
                    id: "3",
                    questionText: "What command creates a new project?",
                    options: [
                      OptionEntity(
                        id: "3.1",
                        optionText: "flutter start",
                        isCorrect: true,
                      ),
                      OptionEntity(id: "3.2", optionText: "flutter create"),
                      OptionEntity(id: "3.3", optionText: "flutter init"),
                    ],
                  ),
                ],
              ),
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
