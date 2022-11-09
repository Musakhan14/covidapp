import 'dart:convert';

import 'package:covid19app/Model/WorldStateModel1.dart';
import 'package:covid19app/Services/Utilities/app_uri.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStateModel1> fetchWorldStateRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateModel1.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countrieList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
