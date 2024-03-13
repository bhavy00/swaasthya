import 'package:flutter/material.dart';

class AddSymptomDialog extends StatefulWidget {
  const AddSymptomDialog({super.key});

  @override
  State<AddSymptomDialog> createState() => _AddSymptomDialogState();
}

class _AddSymptomDialogState extends State<AddSymptomDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _symptomNameController;
  late TextEditingController _symptomDurationController;

  @override
  void initState() {
    super.initState();
    _symptomNameController = TextEditingController();
    _symptomDurationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Symptom'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _symptomNameController,
              decoration: const InputDecoration(labelText: 'Symptom Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter symptom name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _symptomDurationController,
              decoration: const InputDecoration(labelText: 'Symptom Duration'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter symptom duration';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // You can process the form data here

              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
