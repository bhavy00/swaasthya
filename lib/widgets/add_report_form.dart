import 'package:flutter/material.dart';

class AddReportForm extends StatefulWidget {
  const AddReportForm({super.key});

  @override
  State<AddReportForm> createState() => _AddReportFormState();
}

class _AddReportFormState extends State<AddReportForm> {
  String _selectedDepartment = 'Pathology';
  String _filePath = '';

  final List<String> _departments = [
    'Pathology',
    'Radiology',
    'Previous History'
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            value: _selectedDepartment,
            onChanged: (newValue) {
              setState(() {
                _selectedDepartment = newValue!;
              });
            },
            items: _departments.map((String department) {
              return DropdownMenuItem<String>(
                value: department,
                child: Text(department),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Report Type',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {
              // Open file picker to select file
            },
            child: Text('Upload File'),
          ),
        ],
      ),
    );
  }
}
