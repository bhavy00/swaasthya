import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Reports Page'),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: ElevatedButton(
            onPressed: () {
              // Your button action goes here
              print('Button Pressed');
            },
            child: Text('My Button'),
          ),
        ),
      ],
    );
  }
}
