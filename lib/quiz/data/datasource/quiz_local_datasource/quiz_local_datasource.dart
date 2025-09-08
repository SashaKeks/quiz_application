import 'package:quiz_application/quiz/data/datasource/quiz_local_datasource/quiz_datasource_interface.dart';
import 'package:quiz_application/quiz/data/model/option_model.dart';
import 'package:quiz_application/quiz/data/model/question_model.dart';
import 'package:quiz_application/quiz/data/model/quiz_model.dart';

class QuizLocalDatasource implements QuizDatasourceInterface {
  @override
  Future<QuizModel> getQuiz() async {
    return Future.value(
      QuizModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: "Flutter Quiz",
        questions: [
          QuestionModel(
            id: "1",
            questionText: "What is Flutter mainly used for?",
            options: [
              OptionModel(
                id: "1.1",
                optionText: "Cross-platform UI development",
                isCorrect: true,
              ),
              OptionModel(id: "1.2", optionText: "Backend services"),
              OptionModel(id: "1.3", optionText: "Database management"),
            ],
          ),
          QuestionModel(
            id: "2",
            questionText: "Which language is Flutter written in?",
            options: [
              OptionModel(id: "2.1", optionText: "Dart", isCorrect: true),
              OptionModel(id: "2.2", optionText: "Java"),
              OptionModel(id: "2.3", optionText: "Swift"),
            ],
          ),
          QuestionModel(
            id: "3",
            questionText: "What command creates a new project?",
            options: [
              OptionModel(id: "3.1", optionText: "flutter start"),
              OptionModel(
                id: "3.2",
                optionText: "flutter create",
                isCorrect: true,
              ),
              OptionModel(id: "3.3", optionText: "flutter init"),
            ],
          ),
          QuestionModel(
            id: "4",
            questionText: "What is the default package manager for Flutter?",
            options: [
              OptionModel(id: "4.1", optionText: "npm"),
              OptionModel(id: "4.2", optionText: "pub", isCorrect: true),
              OptionModel(id: "4.3", optionText: "pip"),
            ],
          ),
          QuestionModel(
            id: "5",
            questionText: "Which widget is used for layout in Flutter?",
            options: [
              OptionModel(id: "5.1", optionText: "Container"),
              OptionModel(id: "5.2", optionText: "Builder"),
              OptionModel(id: "5.3", optionText: "Column", isCorrect: true),
            ],
          ),
        ],
      ),
    );
  }
}
