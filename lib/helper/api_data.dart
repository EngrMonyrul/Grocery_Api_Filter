import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiData {
  final String baseUrl = 'https://fakestoreapi.com/products/';

  fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body.toString());
        debugPrint(jsonData.toString());
        return jsonData;
      }
    } catch (e) {
      rethrow;
    }
  }
}
