import 'package:flutter/material.dart';

class AddTestForm extends StatefulWidget {
  const AddTestForm({super.key});

  @override
  State<AddTestForm> createState() => _AddTestFormState();
}

class _AddTestFormState extends State<AddTestForm> {
  String test = 'A really big test Name';
  List<String> testList = [];
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Test'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            items: <String>[
              'Adult',
              'Neonate',
              'Child',
              'A really big test Name'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                test = value!;
              });
            },
            decoration: const InputDecoration(
              label: Text('Test'),
              border: OutlineInputBorder(),
            ),
            value: test,
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                testList.add(test);
              });
            },
            label: const Text('Add'),
            icon: const Icon(Icons.add),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 5,
            children: List<Widget>.generate(testList.length, (index) {
              return InputChip(
                label: Text(testList[index]),
                onDeleted: () {
                  setState(() {
                    testList.removeAt(index);
                  });
                },
              );
            }),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
