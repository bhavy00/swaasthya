import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, User!'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Center(
            child:
                Text('Home page for user of Yantram Medtech\'s swaasthya app'),
          ),
        ],
      ),
    );
  }
}
