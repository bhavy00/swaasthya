import 'package:flutter/material.dart';

class AddVitalsDialog extends StatefulWidget {
  const AddVitalsDialog({super.key});

  @override
  State<AddVitalsDialog> createState() => _AddVitalsDialogState();
}

class _AddVitalsDialogState extends State<AddVitalsDialog> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final _formKey = GlobalKey<FormState>();
  // Form field controllers
  final TextEditingController _heartRateController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _spo2Controller = TextEditingController();
  final TextEditingController _highBloodPressureController =
      TextEditingController();
  final TextEditingController _lowBloodPressureController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Vitals Form'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select Date and Time:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: const Text('Select Date'),
                    ),
                    TextButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      child: const Text('Select Time'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter Vitals:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _heartRateController,
                  decoration: const InputDecoration(
                      labelText: 'Heart Rate', suffixText: 'bpm'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _temperatureController,
                  decoration: const InputDecoration(
                      labelText: 'Temperature', suffixText: '°C'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _spo2Controller,
                  decoration:
                      const InputDecoration(labelText: 'SpO2', suffixText: '%'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _highBloodPressureController,
                  decoration: const InputDecoration(
                      labelText: 'High Blood Pressure', suffixText: 'mmHg'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _lowBloodPressureController,
                  decoration: const InputDecoration(
                      labelText: 'Low Blood Pressure', suffixText: 'mmHg'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
