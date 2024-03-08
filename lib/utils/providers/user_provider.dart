import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';

// final userDataProvider = Provider((ref) => UserData());

// class UserData {
//   Future<User> fetchUserData(Pair<String, String> input) {
//     //print("${input.key} ${input.value}");
//     return LoginAPIClient(
//             baseUrl: 'https://yantrammedtech.com/api/v1/user/emailLogin')
//         .login(input.key, input.value);
//   }
// }

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier(const User());
});

class UserNotifier extends StateNotifier<User?> {
  UserNotifier(super.state);

  void updateUser(User user) {
    state = user; 
  }
}
