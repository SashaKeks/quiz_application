class HistoryDataEntity {
  final String quizId;
  final String quizTitle;
  final int score;
  final int total;
  final int timestamp;

  HistoryDataEntity({
    required this.quizId,
    required this.quizTitle,
    required this.score,
    required this.total,
    required this.timestamp,
  });
}