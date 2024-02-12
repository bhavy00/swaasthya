import 'package:flutter/material.dart';

class VitalsInfoPage extends StatefulWidget {
  const VitalsInfoPage({super.key});

  @override
  State<VitalsInfoPage> createState() => _VitalsInfoPageState();
}

class _VitalsInfoPageState extends State<VitalsInfoPage> {
  String _selectedVital = 'Heart Rate';
  String _selectedView = 'Logs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitals Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Select Vital:'),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedVital,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedVital = newValue!;
                      });
                    },
                    items: <String>[
                      'Heart Rate',
                      'Temperature',
                      'SpO2',
                      'Blood Pressure'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Select View:'),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedView,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedView = newValue!;
                      });
                    },
                    items: <String>['Logs', 'Chart']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (_selectedView == 'Logs') ...[
                const VitalsTable(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class VitalsTable extends StatefulWidget {
  const VitalsTable({super.key});
  @override
  State<VitalsTable> createState() => _VitalsTableState();
}

class _VitalsTableState extends State<VitalsTable> {
  List<Map<String, dynamic>> _vitalsData = [
    {'reading': '72', 'time': '15:00', 'date': '2024-02-15'},
    {'reading': '72', 'time': '16:00', 'date': '2024-02-15'},
    {'reading': '72', 'time': '17:00', 'date': '2024-02-15'},
    {'reading': '72', 'time': '18:00', 'date': '2024-02-15'},
    {'reading': '72', 'time': '19:00', 'date': '2024-02-15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          columnSpacing: 5.0,
          columns: const [
            DataColumn(label: Text('Reading')),
            DataColumn(label: Text('Time')),
            DataColumn(label: Text('Date')),
          ],
          rows: _vitalsData.map((data) {
            return DataRow(cells: [
              DataCell(Text(data['reading'])),
              DataCell(Text(data['time'])),
              DataCell(
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    data['date'],
                  ),
                ),
              ),
            ]);
          }).toList(),
        ),
      ],
    );
  }
}
