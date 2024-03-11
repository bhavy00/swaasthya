import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:swaasthya/apis/urls.dart';

class LoginAPIClient {
  LoginAPIClient();

  Future<Map<String,dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/user/emailLogin'),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ArgumentError('Failed to login', response.body);
    }
  }
}
