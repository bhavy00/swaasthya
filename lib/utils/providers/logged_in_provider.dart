import 'package:flutter_riverpod/flutter_riverpod.dart';

final loggedInProvider =
    StateNotifierProvider<LoginNotifier, bool>((ref) => LoginNotifier(false));

class LoginNotifier extends StateNotifier<bool> {
  LoginNotifier(super.state);
  void logIn(bool value) {
    state = value;
  }
}
