import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../model/data.dart';

class DataProvider {
  Future<List<DataModel>> fetchData(String jsonFileName) async {
    String jsonString = await rootBundle.loadString('assets/json/$jsonFileName');
    final json = jsonDecode(jsonString);
    List<dynamic> jsonData = json['data'];
    return jsonData.map((item) => DataModel.fromJson(item)).toList();
  }

}
