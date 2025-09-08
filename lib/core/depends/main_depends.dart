import 'package:get_it/get_it.dart';
import 'package:quiz_application/quiz/data/datasource/quiz_local_datasource/quiz_datasource_interface.dart';
import 'package:quiz_application/quiz/data/datasource/quiz_local_datasource/quiz_local_datasource.dart';
import 'package:quiz_application/quiz/data/service/quiz_service.dart';
import 'package:quiz_application/quiz/domain/repository/quiz_repository.dart';
import 'package:quiz_application/quiz/domain/usecase/get_quiz_usecase.dart';

GetIt _getIt = GetIt.instance;

class MainDepends {
  static void init() {
    _getIt.registerLazySingleton<QuizDatasourceInterface>(
      () => QuizLocalDatasource(),
    );
    _getIt.registerLazySingleton<QuizRepository>(() => QuizService(_getIt()));
    _getIt.registerFactory<GetQuizUseCase>(() => GetQuizUseCase(_getIt()));
  }
}
