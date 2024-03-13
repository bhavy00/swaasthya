import 'package:flutter/material.dart';

class HubsPage extends StatelessWidget {
  const HubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> hubs = [
      ['Hub1', 'online'],
      ['Hub2', 'online'],
      ['Hub3', 'offline'],
      ['Hub4', 'online'],
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hubs'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: List.generate(
                  hubs.length,
                  (index) {
                    final hub = hubs[index];
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.satellite_alt,
                              size: 32,
                            ),
                            Text(
                              hub[0],
                              style: const TextStyle(fontSize: 16),
                            ),
                            Chip(
                              label: Text(hub[1]),
                              backgroundColor: hub[1] == 'online'
                                  ? Colors.green
                                  : Colors.red,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: const Text('Add Hub'),
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ));
  }
}
