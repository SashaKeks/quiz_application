class OptionEntity {
  final String id;
  final String optionText;
  final bool isCorrect;

  OptionEntity({
    required this.id,
    required this.optionText,
    this.isCorrect = false,
  });
}
