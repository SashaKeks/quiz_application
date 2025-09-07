import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz_event.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz_state.dart';

class QuizBloc  extends Bloc<QuizEvent, QuizState>{
  QuizBloc() : super(const QuizState());


}