import 'package:flutter/material.dart';

class DischargePatientForm extends StatefulWidget {
  const DischargePatientForm({super.key});

  @override
  State<DischargePatientForm> createState() => _DischargePatientFormState();
}

class _DischargePatientFormState extends State<DischargePatientForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _reasonForDischarge = 'Discharge Success';
  final DateTime _selectedDate = DateTime.now();
  String _diet = '';
  String _adviceOnDischarge = '';
  String _finalDiagnosis = '';
  String _prescription = '';
  String _followupRequired = 'No';
  final DateTime _followupDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discharge Patient'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _reasonForDischarge,
                onChanged: (newValue) {
                  setState(() {
                    _reasonForDischarge = newValue!;
                  });
                },
                items: <String>[
                  'Discharge Success',
                  'DOPR',
                  'Absconded',
                  'Left against medical advice',
                  'Death'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration:
                    const InputDecoration(labelText: 'Reason for Discharge'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                initialValue: _selectedDate.toString(),
                enabled: false,
                decoration: const InputDecoration(labelText: 'Date'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                maxLines: null,
                onChanged: (value) {
                  _diet = value;
                },
                decoration: const InputDecoration(labelText: 'Diet'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                maxLines: null,
                onChanged: (value) {
                  _adviceOnDischarge = value;
                },
                decoration:
                    const InputDecoration(labelText: 'Advice on Discharge'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                maxLines: null,
                onChanged: (value) {
                  _finalDiagnosis = value;
                },
                decoration: const InputDecoration(labelText: 'Final Diagnosis'),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                maxLines: null,
                onChanged: (value) {
                  _prescription = value;
                },
                decoration: const InputDecoration(labelText: 'Prescription'),
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
                decoration:
                    const InputDecoration(labelText: 'Followup Required'),
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
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the form data
                    // You can print or save the form data here
                    print('Reason for Discharge: $_reasonForDischarge');
                    print('Date: $_selectedDate');
                    print('Diet: $_diet');
                    print('Advice on Discharge: $_adviceOnDischarge');
                    print('Final Diagnosis: $_finalDiagnosis');
                    print('Prescription: $_prescription');
                    print('Followup Required: $_followupRequired');
                    if (_followupRequired == 'Yes') {
                      print('Followup Date: $_followupDate');
                    }
                  }
                },
                child: const Text('Discharge'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
