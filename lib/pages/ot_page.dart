import 'package:flutter/material.dart';

class OTPage extends StatelessWidget {
  const OTPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Operation Theater'),
        centerTitle: true,
      ),
      body: const Center(child: Text('Comming Soon'),)
    );
  }
}