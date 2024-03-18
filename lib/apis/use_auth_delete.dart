import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swaasthya/apis/urls.dart';

Future<Map<String, dynamic>> authDelete(String url, String? token) async {
  final response = await http.delete(
    Uri.parse('$apiUrl/$url'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    },
  );
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return json.decode(response.body);
  } else {
    throw ArgumentError('Failed to post', response.body);
  }
}
