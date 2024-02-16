import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/forms/add_symptom_dialog.dart';

List<Map<String, String>> symptoms = [
  {'name': 'Headache', 'duration': '2 days'},
  {'name': 'Fever', 'duration': '3 days'},
  // Add more symptoms as needed
];

class SymptomsWidget extends StatefulWidget {
  const SymptomsWidget({super.key});

  @override
  State<SymptomsWidget> createState() => _SymptomsWidgetState();
}

class _SymptomsWidgetState extends State<SymptomsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // symptoms
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Symptoms'),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AddSymptomDialog();
                    });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Center(
          child: DataTable(
            columnSpacing: MediaQuery.of(context).size.width * 0.2,
            columns: const [
              DataColumn(
                  label: Expanded(
                child: Text(
                  'Symptom Name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataColumn(
                  label: Text(
                'Duration',
                maxLines: 2,
              )),
              DataColumn(
                  label: Text(
                'Action',
                maxLines: 2,
              )),
            ],
            rows: List.generate(symptoms.length, (index) {
              return DataRow(
                cells: [
                  DataCell(
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(symptoms[index]['name']!),
                    ),
                  ),
                  DataCell(Text(symptoms[index]['duration']!)),
                  DataCell(
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          symptoms.removeAt(index);
                        });
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
