import 'package:quiz_application/quiz/domain/entity/history_data_entity.dart';

class HistoryDataModel extends HistoryDataEntity {
  HistoryDataModel({
    required super.quizId,
    required super.score,
    required super.quizTitle,
    required super.total,
    required super.timestamp,
  });

  HistoryDataModel.fromEntity(HistoryDataEntity entity)
    : super(
        quizId: entity.quizId,
        score: entity.score,
        quizTitle: entity.quizTitle,
        total: entity.total,
        timestamp: entity.timestamp,
      );

  factory HistoryDataModel.fromJson(Map<String, dynamic> json) {
    return HistoryDataModel(
      quizId: json['quizId'],
      score: json['score'],
      quizTitle: json['quizTitle'],
      total: json['total'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'score': score,
      'quizTitle': quizTitle,
      'total': total,
      'timestamp': timestamp,
    };
  }
}
