import 'package:get_it/get_it.dart';
import 'package:quiz_application/quiz/data/datasource/history_local_datasource/history_datasource_interface.dart';
import 'package:quiz_application/quiz/data/datasource/history_local_datasource/history_local_datasource.dart';
import 'package:quiz_application/quiz/data/datasource/quiz_local_datasource/quiz_datasource_interface.dart';
import 'package:quiz_application/quiz/data/datasource/quiz_local_datasource/quiz_local_datasource.dart';
import 'package:quiz_application/quiz/data/service/history_service.dart';
import 'package:quiz_application/quiz/data/service/quiz_service.dart';
import 'package:quiz_application/quiz/domain/repository/history_repository.dart';
import 'package:quiz_application/quiz/domain/repository/quiz_repository.dart';
import 'package:quiz_application/quiz/domain/usecase/get_history_usecase.dart';
import 'package:quiz_application/quiz/domain/usecase/get_quiz_usecase.dart';
import 'package:quiz_application/quiz/domain/usecase/save_history_usecase.dart';

GetIt _getIt = GetIt.instance;

class MainDepends {
  static void init() {
    _quizInit();
    _historyInit();
  }

  static void _quizInit() {
    _getIt.registerLazySingleton<QuizDatasourceInterface>(
      () => QuizLocalDatasource(),
    );
    _getIt.registerLazySingleton<QuizRepository>(() => QuizService(_getIt()));
    _getIt.registerFactory<GetQuizUseCase>(() => GetQuizUseCase(_getIt()));
  }

  static void _historyInit() {
    _getIt.registerLazySingleton<HistoryDatasourceInterface>(
      () => HistoryLocalDatasource(),
    );
    _getIt.registerLazySingleton<HistoryRepository>(
      () => HistoryService(_getIt()),
    );
    _getIt.registerFactory<GetHistoryUseCase>(
      () => GetHistoryUseCase(_getIt()),
    );
    _getIt.registerFactory<SaveHistoryUseCase>(
      () => SaveHistoryUseCase(_getIt()),
    );
  }
}
