class OptionEntity {
  /// Creates a new instance of [OptionEntity]. With check correct or not
  final String id;
  final String optionText;
  final bool isCorrect;

  OptionEntity({
    required this.id,
    required this.optionText,
    this.isCorrect = false,
  });
}
