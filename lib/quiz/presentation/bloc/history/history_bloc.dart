import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';
import 'package:quiz_application/quiz/domain/usecase/get_history_usecase.dart';
import 'package:quiz_application/quiz/domain/usecase/save_history_usecase.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_event.dart';
import 'package:quiz_application/quiz/presentation/bloc/history/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetHistoryUseCase getHistoryUseCase;
  final SaveHistoryUseCase saveHistoryUseCase;
  HistoryBloc({
    required this.getHistoryUseCase,
    required this.saveHistoryUseCase,
  }) : super(HistoryState(history: [])) {
    on<HistoryGetEvent>((event, emit) async {
      final history = await getHistoryUseCase.call();
      emit(state.copyWith(history: history));
    });

    on<HistoryNewDataSaveEvent>((event, emit) {
      emit(state.copyWith(history: [...state.history, event.historyData]));
    });

    on<HistorySaveEvent>((event, emit) {
      final historyData = HistoryDataEntity(
        quizId: event.quizId,
        quizTitle: event.quizTitle,
        score: event.score,
        total: event.total,
        timestamp: event.timestamp,
      );
      saveHistoryUseCase.call(historyData).then((_) {
        add(HistoryNewDataSaveEvent(historyData: historyData));
      });
    });
  }
}
