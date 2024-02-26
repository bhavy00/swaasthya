import 'package:flutter/material.dart';
import 'package:swaasthya/apis/login.dart';
import 'package:swaasthya/pages/welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginAPIClient apiClient = LoginAPIClient(
      baseUrl: 'https://yantrammedtech.com/api/v1/user/emailLogin');
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: Theme.of(context).textTheme.headlineLarge,
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
              obscureText: hide,
              decoration: InputDecoration(
                  labelText: 'Password',
                  suffix: IconButton(
                    icon: Icon(hide ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        hide = !hide;
                      });
                    },
                  )),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final userData = await apiClient.login(email, password);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return WelcomePage(userData: userData);
            },
          ),
        );
      } catch (e) {
        //print(e);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Failed to login, please try again later'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter both email and password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
