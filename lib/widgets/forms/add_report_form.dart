import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/apis/use_auth_post.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';
import 'package:swaasthya/utils/types_and_category.dart';

class AddReportForm extends StatefulWidget {
  final dynamic patient;
  final String? token;
  const AddReportForm({super.key, this.patient, this.token});

  @override
  State<AddReportForm> createState() => _AddReportFormState();
}

class _AddReportFormState extends State<AddReportForm> {
  String _selectedDepartment = 'Pathology';
  String? _filePath, _fileName;
  bool err = false, uploaded = false;
  void _openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          _fileName = result.files.single.name;
          _filePath = result.files.single.path;
        });
        print(_fileName);
      } else {
        // User canceled the picker
      }
    } catch (e) {
      print(e);
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
      child: err
          ? const Text('An error occured')
          : uploaded
              ? const Text('File upload successful')
              : Column(
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
                            ? Text(_fileName!)
                            : const Text('No file selected')
                      ],
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        final int? userID = ref.read(userProvider)?.id;
                        return TextButton(
                          onPressed: () async {
                            try {
                              await authPost(
                                  'attachment/${widget.patient['hospitalID']}/${widget.patient['patientTimeLineID']}/$userID',
                                  widget.token, {
                                'category': reportType[_selectedDepartment],
                                'file': File(_filePath!),
                              });
                              setState(() {
                                uploaded = true;
                              });
                            } catch (e) {
                              setState(() {
                                err = true;
                              });
                              print(e);
                            }
                          },
                          child: const Text('Upload File'),
                        );
                      },
                    ),
                  ],
                ),
    );
  }
}
