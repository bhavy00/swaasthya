import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Reports Page'),
        Container(
          height: 1000,
          color: Colors.amber,
        )
      ],
    );
  }
}
