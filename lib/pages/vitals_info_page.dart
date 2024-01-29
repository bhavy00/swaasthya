import 'package:flutter/material.dart';

class VitalsInfoPage extends StatelessWidget {
  const VitalsInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitals info page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Do we really need this page'),
          ],
        ),
      ),
    );
  }
}
