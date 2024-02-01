import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_report_form.dart';

List<String> types = ['Pathology', 'Radiology', 'Previous History'];

List<String> reports = ['test_report_1', 'test_report_2', 'test_report_3'];

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
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Report Name')),
              DataColumn(label: Text('Download Report')),
              DataColumn(label: Text('Delete')),
            ],
            rows: List.generate(reports.length, (index) {
              return DataRow(cells: [
                DataCell(Text(reports[index])),
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
        ),
        Align(
          alignment: Alignment.topRight,
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
    );
  }
}
