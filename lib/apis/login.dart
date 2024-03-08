import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginAPIClient {
  final String baseUrl;

  LoginAPIClient({required this.baseUrl});

  Future<Map<String,dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
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
