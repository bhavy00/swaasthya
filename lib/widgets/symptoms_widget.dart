import 'package:flutter/material.dart';
import 'package:swaasthya/apis/symptoms_api.dart';
import 'package:swaasthya/widgets/forms/add_symptom_dialog.dart';

class SymptomsWidget extends StatefulWidget {
  final int? timelineID;
  final String? token;
  const SymptomsWidget(
      {super.key, required this.timelineID, required this.token});

  @override
  State<SymptomsWidget> createState() => _SymptomsWidgetState();
}

class _SymptomsWidgetState extends State<SymptomsWidget> {
  List<dynamic> symptoms = [];
  void _fetchSymptomList() async {
    try {
      final data = await Symptoms(
        timelineID: widget.timelineID,
        token: widget.token,
      ).getSymptoms();
      symptoms = data['symptoms'];
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchSymptomList();
  }

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
        symptoms.isEmpty
            ? const Text('No symptoms added')
            : Center(
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
