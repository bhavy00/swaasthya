import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swaasthya/apis/urls.dart';

class PatientApi {
  final int? hospitalID;
  final int patientStatus;
  final int? role;
  final int? userID;
  final String? token;

  PatientApi({
    required this.hospitalID,
    required this.patientStatus,
    required this.role,
    required this.userID,
    required this.token,
  });

  Future<Map<String, dynamic>> getRecentPatient() async {
    final response = await http.get(
        Uri.parse(
            '$apiUrl/patient/$hospitalID/patients/recent/$patientStatus?role=$role&userID=$userID'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ArgumentError('Failed to fetch', response.body);
    }
  }
  Future<Map<String, dynamic>> getPatientById(int patientId) async {
    final response = await http.get(
        Uri.parse(
            '$apiUrl/patient/$hospitalID/patients/single/$patientId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ArgumentError('Failed to fetch', response.body);
    }
  }
}
