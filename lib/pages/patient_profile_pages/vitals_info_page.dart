import 'dart:async';

import 'package:flutter/material.dart';

class VitalsInfoPage extends StatefulWidget {
  final List<dynamic>? vitals;
  const VitalsInfoPage({super.key, this.vitals});

  @override
  State<VitalsInfoPage> createState() => _VitalsInfoPageState();
}

class _VitalsInfoPageState extends State<VitalsInfoPage> {
  String _selectedVital = 'Pulse';
  String _selectedView = 'Logs';
  bool loading = false;
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
                        loading = true;
                      });
                      Timer(const Duration(seconds: 1), () {
                        setState(() {
                          loading = false;
                        });
                      });
                    },
                    items: <String>['Pulse', 'Temperature', 'Oxygen', 'BP']
                        .map<DropdownMenuItem<String>>((String value) {
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
              loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _selectedView == 'Logs'
                      ? VitalsTable(vitals: widget.vitals, type: _selectedVital)
                      : const Text('chart')
            ],
          ),
        ),
      ),
    );
  }
}

class VitalsTable extends StatefulWidget {
  final List<dynamic>? vitals;
  final String type;
  const VitalsTable({super.key, required this.vitals, required this.type});
  @override
  State<VitalsTable> createState() => _VitalsTableState();
}

class _VitalsTableState extends State<VitalsTable> {
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
          rows: widget.vitals?.map((data) {
                DateTime date = DateTime.parse(
                    data['${widget.type.toLowerCase()}Time'] ??
                        data['addedOn']);
                return DataRow(cells: [
                  DataCell(Text('${data[widget.type.toLowerCase()]}')),
                  DataCell(Text('${date.hour}:${date.minute}:${date.second}')),
                  DataCell(
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text('${date.day}-${date.month}-${date.year}'),
                    ),
                  ),
                ]);
              }).toList() ??
              [],
        ),
      ],
    );
  }
}
