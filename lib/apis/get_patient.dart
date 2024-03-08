import 'package:http/http.dart' as http;
import 'dart:convert';

class GetPatient {
  final int? hospitalID;
  final int patientStatus;
  final int? role;
  final int? userID;
  final String? token;

  GetPatient({
    required this.hospitalID,
    required this.patientStatus,
    required this.role,
    required this.userID,
    required this.token,
  });

  Future<Map<String, dynamic>> getPatient() async {
    final response = await http.get(
        Uri.parse(
            'https:/yantrammedtech.com/api/v1/patient/$hospitalID/patients/$patientStatus?role=$role&userID=$userID'),
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
