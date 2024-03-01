import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:swaasthya/utils/classes/user_data_class.dart';

class LoginAPIClient {
  final String baseUrl;

  LoginAPIClient({required this.baseUrl});

  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      User user = User(
        id: jsonMap['id'],
        hospitalID: jsonMap['hospitalID'],
        departmentID: jsonMap['departmentID'],
        role: jsonMap['role'],
        email: jsonMap['email'],
        countryCode: jsonMap['countryCode'],
        phoneNo: jsonMap['phoneNo'],
        firstName: jsonMap['firstName'],
        lastName: jsonMap['lastName'],
        photo: jsonMap['photo'],
        dob: DateTime.parse(jsonMap['dob']),
        gender: jsonMap['gender'],
        address: jsonMap['address'],
        city: jsonMap['city'],
        state: jsonMap['state'],
        pinCode: jsonMap['pinCode'],
        addedOn: DateTime.parse(jsonMap['addedOn']),
        lastUpdated: DateTime.parse(jsonMap['lastUpdated']),
        token: jsonMap['token'],
        imageURL: jsonMap['imageURL'],
      );
      return user;
    } else {
      throw ArgumentError('Failed to login', response.body);
    }
  }
}
