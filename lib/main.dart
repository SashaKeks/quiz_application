import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_application/core/depends/main_depends.dart';
import 'package:quiz_application/quiz/domain/usecase/get_history_usecase.dart';
import 'package:quiz_application/quiz/domain/usecase/get_quiz_usecase.dart';
import 'package:quiz_application/quiz/domain/usecase/save_history_usecase.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_event.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_application/quiz/presentation/bloc/quiz/quiz_event.dart';
import 'package:quiz_application/quiz/presentation/pages/quiz_page.dart';

void main() {
  MainDepends.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (_) =>
                    QuizBloc(GetIt.instance<GetQuizUseCase>())
                      ..add(QuizStarted()),
          ),
          BlocProvider(
            create:
                (_) => HistoryBloc(
                  getHistoryUseCase: GetIt.instance<GetHistoryUseCase>(),
                  saveHistoryUseCase: GetIt.instance<SaveHistoryUseCase>(),
                )..add(HistoryGetEvent()),
          ),
        ],
        child: const QuizPage(),
      ),
    );
  }
}
