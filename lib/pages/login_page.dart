import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/apis/login.dart';
import 'package:swaasthya/pages/welcome_page.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool hide = true;

  void _login(BuildContext context, WidgetRef ref) async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      try {
        final user = await LoginAPIClient(
                baseUrl: 'https://yantrammedtech.com/api/v1/user/emailLogin')
            .login(email, password);
        // print(user);
        ref.read(userProvider.notifier).updateUser(User.fromMap(user));
        // user.forEach((key, value) {
        //   print('$key: ${value.runtimeType}');
        // });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const WelcomePage();
            },
          ),
        );
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please try again. $e'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter both email and password.'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            obscureText: hide,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hide = !hide;
                  });
                },
                icon: Icon(hide ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          Consumer(
            builder: (context, ref, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _login(context, ref);
                  },
                  child: isLoading
                      ? const CircularProgressIndicator.adaptive()
                      : const Text('Login'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
