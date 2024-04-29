import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProphetAlgorithm {
  final DateTime startDate;
  final DateTime endDate;
  final String baseURL;

  ProphetAlgorithm(
      {required this.startDate, required this.endDate, required this.baseURL});

  Future<Map<String, double>> forecastVal() async {
    try {
      String start = startDate.toIso8601String().substring(0, 10);
      String end = endDate.toIso8601String().substring(0, 10);

      var response = await http.post(
        Uri.parse('$baseURL/'),
        body: {'dateStart': start, 'dateEnd': end},
      );

      print("Status code $response");

      if (response.statusCode == 200) {
        print("Response body: ${response.body}");

        Map<String, dynamic> data = json.decode(response.body);
        // Check if the response contains an error
        if (data.containsKey('error')) {
          throw Exception(data['error']);
        }
        Map<String, double> forecastData = {};
        print("Data in prediction: $data");

        data.forEach((key, value) {
          // Convert the key from DateTime to String
          String dateStr = key.substring(0, 10);
          forecastData[dateStr] = value.toDouble();
          print("ForecastData in prediction loop: $forecastData");
        });

        print("ForecastData in prediction: $forecastData");

        return forecastData;
      } else {
        throw Exception('Failed to get forecast data');
      }
    } catch (e) {
      throw e;
    }
  }
}
