import 'package:flutter/material.dart';

class TransferPatientForm extends StatefulWidget {
  const TransferPatientForm({super.key});

  @override
  State<TransferPatientForm> createState() => _TransferPatientFormState();
}

class _TransferPatientFormState extends State<TransferPatientForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _transferType = 'External';
  String _hospitalName = '';
  String _reason = '';
  int _oxygen = 0;
  double _temperature = 0.0;
  int _pulse = 0;
  int _bloodPressureHigh = 0;
  int _bloodPressureLow = 0;
  String _relativeName = '';
  String _ward = '';
  String _doctorName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Patient'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _transferType,
                onChanged: (String? newValue) {
                  setState(() {
                    _transferType = newValue!;
                  });
                },
                items: <String>[
                  'Internal',
                  'External',
                  'Emergency',
                  'Non-Emergency'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration:
                    const InputDecoration(labelText: 'Type of Transfer'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the type of transfer';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              if (_transferType == 'Internal') ...[
                const SizedBox(height: 12.0),
                TextFormField(
                  onChanged: (value) {
                    _ward = value;
                  },
                  decoration: const InputDecoration(labelText: 'Ward'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ward';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  onChanged: (value) {
                    _doctorName = value;
                  },
                  decoration: const InputDecoration(labelText: 'Doctor Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor name';
                    }
                    return null;
                  },
                ),
              ],
              if (_transferType != 'Internal') ...[
                TextFormField(
                  onChanged: (value) {
                    _hospitalName = value;
                  },
                  decoration: const InputDecoration(labelText: 'Hospital Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the hospital name';
                    }
                    return null;
                  },
                ),
              ],
              const SizedBox(height: 12.0),
              TextFormField(
                onChanged: (value) {
                  _reason = value;
                },
                decoration: const InputDecoration(labelText: 'Reason'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the reason';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _oxygen = int.tryParse(value) ?? 0;
                },
                decoration:
                    const InputDecoration(labelText: 'Oxygen', suffixText: '%'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter oxygen level';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _temperature = double.tryParse(value) ?? 0.0;
                },
                decoration: const InputDecoration(
                    labelText: 'Temperature', suffixText: '°C'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter temperature';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _pulse = int.tryParse(value) ?? 0;
                },
                decoration: const InputDecoration(
                    labelText: 'Pulse', suffixText: 'bpm'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pulse';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _bloodPressureHigh = int.tryParse(value) ?? 0;
                },
                decoration: const InputDecoration(
                    labelText: 'Blood Pressure High', suffixText: 'mmHg'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter blood pressure high';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _bloodPressureLow = int.tryParse(value) ?? 0;
                },
                decoration: const InputDecoration(
                    labelText: 'Blood Pressure Low', suffixText: 'mmHg'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter blood pressure low';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                onChanged: (value) {
                  _relativeName = value;
                },
                decoration: const InputDecoration(labelText: 'Relative Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter relative name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the form data
                    // You can print or save the form data here
                    print('Transfer Type: $_transferType');
                    print('Hospital Name: $_hospitalName');
                    print('Reason: $_reason');
                    print('Oxygen: $_oxygen');
                    print('Temperature: $_temperature');
                    print('Pulse: $_pulse');
                    print('Blood Pressure High: $_bloodPressureHigh');
                    print('Blood Pressure Low: $_bloodPressureLow');
                    print('Relative Name: $_relativeName');
                    if (_transferType == 'Internal') {
                      print('Ward: $_ward');
                      print('Doctor Name: $_doctorName');
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
