import 'package:quiz_application/quiz/data/model/quiz_model.dart';

abstract class QuizDatasourceInterface {
  Future<QuizModel> getQuiz();
  
}
