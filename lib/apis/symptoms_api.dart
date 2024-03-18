import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swaasthya/apis/urls.dart';

class Symptoms {
  final int? timelineID;
  final String? token;
  const Symptoms({required this.timelineID, required this.token});

  Future<Map<String, dynamic>> getSymptoms() async {
    final response = await http.get(
      Uri.parse('$apiUrl/symptom/$timelineID'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ArgumentError('Failed to fetch', response.body);
    }
  }

  Future<Map<String, dynamic>> deleteSymptom(int id) async {
    final response = await http.post(
      Uri.parse('$apiUrl/symptom/$timelineID/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ArgumentError('Failed to fetch', response.body);
    }
  }
}
