import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/pages/welcome_page.dart';
import 'package:swaasthya/utils/pair.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';

final fetchUserProvider =
    FutureProvider.family((ref, Pair<String, String> input) {
  final userData = ref.watch(userDataProvider);
  return userData.fetchUserData(input);
});

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),
            Consumer(
              builder: ((context, ref, child) {
                return ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

//   void _login(BuildContext context, FutureProvider.family<User,Pair<String,String>> fetchUserProvider) {
//     final String email = _emailController.text.trim();
//     final String password = _passwordController.text.trim();

//     if (email.isNotEmpty && password.isNotEmpty) {
//       fetchUserProvider(email, password);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: const Text('Please enter both email and password.'),
//           backgroundColor: Theme.of(context).colorScheme.errorContainer,
//         ),
//       );
//     }
//   }
// }
}
