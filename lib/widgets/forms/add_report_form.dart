import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddReportForm extends StatefulWidget {
  const AddReportForm({super.key});

  @override
  State<AddReportForm> createState() => _AddReportFormState();
}

class _AddReportFormState extends State<AddReportForm> {
  String _selectedDepartment = 'Pathology';
  String? _filePath;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    } else {
      // User canceled the picker
    }
  }

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
          const SizedBox(height: 20.0),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              FilledButton(
                onPressed: _openFilePicker,
                child: const Text('Select File'),
              ),
              _filePath != null
                  ? Text(_filePath!)
                  : const Text('No file selected')
            ],
          ),
          TextButton(
            onPressed: () {
              // Open file picker to select file
            },
            child: const Text('Upload File'),
          ),
        ],
      ),
    );
  }
}
