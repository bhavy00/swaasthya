import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/apis/login.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/utils/pair.dart';

final userDataProvider = Provider((ref) => UserData());

class UserData {
  Future<User> fetchUserData(Pair<String, String> input) {
    return LoginAPIClient(baseUrl: 'https://yantrammedtech.com/api/v1/emailLogin').login(input.key, input.value);
  }
}
