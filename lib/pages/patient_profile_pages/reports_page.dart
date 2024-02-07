import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/add_report_form.dart';

List<String> types = ['Pathology', 'Radiology', 'Previous History'];

List<String> reports = [
  'test_report_1',
  'test_report_2',
  'test_report_3',
  'test_report_4',
  'test_report_5',
  'test_report_6',
  'test_report_7',
  'test_report_8',
  'test_report_9',
  'test_report_10',
  'test_report_11',
];

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _reportType = 'Pathology';
  void _changeReportType(String? value) {
    setState(() {
      _reportType = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Type of Report: '),
                  DropdownButton(
                    value: _reportType,
                    onChanged: _changeReportType,
                    items: types.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Expanded(
                      child: Text(
                        'Report Name',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                    DataColumn(
                        label: Expanded(
                            child: Text(
                      'Download Report',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ))),
                    DataColumn(label: Text('Delete')),
                  ],
                  rows: List.generate(reports.length, (index) {
                    return DataRow(cells: [
                      DataCell(Expanded(
                          child: Text(
                        reports[index],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ))),
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.download),
                          onPressed: () {},
                        ),
                      ),
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              reports.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ]);
                  }),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text('Upload report'),
                                content: AddReportForm(),
                              );
                            });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
