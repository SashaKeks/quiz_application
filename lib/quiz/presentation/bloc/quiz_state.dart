import 'package:equatable/equatable.dart';
import 'package:quiz_application/quiz/domain/entity/quiz_entity.dart';

class QuizState extends Equatable {
  final QuizEntity? quiz;

  const QuizState({this.quiz});

  QuizState copyWith({QuizEntity? Function()? quiz}) {
    return QuizState(quiz: quiz != null ? quiz() : this.quiz);
  }

  @override
  List<Object?> get props => [quiz];
}
