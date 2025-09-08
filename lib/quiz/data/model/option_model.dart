import 'package:quiz_application/quiz/domain/entity/option_entity.dart';

class OptionModel extends OptionEntity {
  /// Creates a new instance of [OptionModel]. With check correct or not
  OptionModel({required super.id, required super.optionText, super.isCorrect});
}
