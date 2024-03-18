import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swaasthya/apis/urls.dart';

Future<Map<String, dynamic>> authPost(
    String url, String? token, dynamic body) async {
  final response = await http.post(Uri.parse('$apiUrl/$url'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      },
      body: json.encode(body));
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return json.decode(response.body);
  } else {
    throw ArgumentError('Failed to post', response.body);
  }
}
