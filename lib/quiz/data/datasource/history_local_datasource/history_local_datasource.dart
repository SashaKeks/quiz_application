import 'dart:convert';

import 'package:quiz_application/quiz/data/datasource/history_local_datasource/history_datasource_interface.dart';
import 'package:quiz_application/quiz/data/model/history_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryLocalDatasource implements HistoryDatasourceInterface {
  @override
  Future<List<HistoryDataModel>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('quiz_history');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => HistoryDataModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> saveHistory(HistoryDataModel historyData) async {
    final prefs = await SharedPreferences.getInstance();
    final data = await getHistory();
    data.add(historyData);
    final jsonString = jsonEncode(data.map((e) => e.toJson()).toList());
    await prefs.setString('quiz_history', jsonString);
  }
}
