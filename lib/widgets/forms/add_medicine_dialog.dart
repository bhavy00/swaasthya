import 'package:flutter/material.dart';

class AddMedicineDialog extends StatefulWidget {
  const AddMedicineDialog({super.key});

  @override
  State<AddMedicineDialog> createState() => _AddMedicineDialogState();
}

class _AddMedicineDialogState extends State<AddMedicineDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _medicineNameController;
  late TextEditingController _durationController;
  late TextEditingController _numberOfDosesController;
  late TextEditingController _notesController;
  String type = 'Capsules';
  String time = 'Before Meal';
  @override
  void initState() {
    super.initState();
    _medicineNameController = TextEditingController();
    _durationController = TextEditingController();
    _numberOfDosesController = TextEditingController();
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _durationController.dispose();
    _numberOfDosesController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Medicine Treatment'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                items: <String>[
                  'Capsules',
                  'Syrups',
                  'Tablets',
                  'Injections',
                  'IV Line'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    type = value!;
                  });
                },
                decoration: const InputDecoration(
                  label: Text('Type'),
                  border: OutlineInputBorder(),
                ),
                value: type,
              ),
              TextFormField(
                controller: _medicineNameController,
                decoration: const InputDecoration(labelText: 'Medicine Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter medicine name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(
                    labelText: 'Duration',
                    hintText: 'number of days',
                    suffixText: 'Days'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter duration';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numberOfDosesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Number of Doses'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of doses';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                items: <String>[
                  'Before Meal',
                  'After Meal',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    time = value!;
                  });
                },
                decoration: const InputDecoration(
                  label: Text('Medication Time'),
                  border: OutlineInputBorder(),
                ),
                value: time,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
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
