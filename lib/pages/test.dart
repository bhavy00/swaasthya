import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Vertical scrolling list
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
        // Horizontal scrolling grid
        Container(
          height: 100,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Set to 1 for horizontal scrolling
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                margin: const EdgeInsets.all(8),
                color: Colors.blue,
                child: Center(
                  child: Text('Item $index'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
