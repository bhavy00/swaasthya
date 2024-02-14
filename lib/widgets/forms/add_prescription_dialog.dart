import 'package:flutter/material.dart';

class AddPrescriptionDialog extends StatefulWidget {
  const AddPrescriptionDialog({super.key});

  @override
  State<AddPrescriptionDialog> createState() => _AddPrescriptionDialogState();
}

class _AddPrescriptionDialogState extends State<AddPrescriptionDialog> {
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _testController = TextEditingController();
  final TextEditingController _adviceController = TextEditingController();
  String _followupRequired = 'No';
  final DateTime _followupDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Prescription'),
      content: Form(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _diagnosisController,
              decoration: const InputDecoration(labelText: 'Diagnosis'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _testController,
              decoration: const InputDecoration(labelText: 'Test'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _adviceController,
              decoration: const InputDecoration(labelText: 'Advice'),
              maxLines: 3,
            ),
            const SizedBox(height: 12.0),
            DropdownButtonFormField<String>(
              value: _followupRequired,
              onChanged: (newValue) {
                setState(() {
                  _followupRequired = newValue!;
                });
              },
              items: <String>['Yes', 'No']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Followup Required'),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              enabled: _followupRequired == 'Yes',
              onChanged: (value) {
                // Parse date if needed
                // _followupDate = DateTime.parse(value);
              },
              decoration: const InputDecoration(
                labelText: 'Followup Date',
                hintText: 'YYYY-MM-DD',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // You can access the entered values using the controllers
                String diagnosis = _diagnosisController.text;
                String notes = _notesController.text;
                String test = _testController.text;
                String advice = _adviceController.text;

                // Do something with the entered data
                print('Diagnosis: $diagnosis');
                print('Notes: $notes');
                print('Test: $test');
                print('Advice: $advice');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      )),
    );
  }
}
