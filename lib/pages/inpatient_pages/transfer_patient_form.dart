import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/apis/use_auth_patch.dart';
import 'package:swaasthya/utils/types_and_category.dart';

class TransferPatientForm extends StatefulWidget {
  final String? token;
  final dynamic patient;
  const TransferPatientForm({
    super.key,
    this.token,
    this.patient,
  });

  @override
  State<TransferPatientForm> createState() => _TransferPatientFormState();
}

class _TransferPatientFormState extends State<TransferPatientForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _transferType = 'External';
  String? _hospitalName = '';
  String? _reason = '';
  int? _oxygen = 0;
  double? _temperature = 0.0;
  int? _pulse = 0;
  int? _bloodPressureHigh = 0;
  int? _bloodPressureLow = 0;
  String? _relativeName = '';
  int? wardID = 0;
  String? _doctorName = '';
  int? departmentID = 1;
  bool load = false;
  List<dynamic> doctors = [];
  List<dynamic> wards = [];

  Future<void> _getAllDoctors() async {
    final data = await authFetch(
        'user/${widget.patient['hospitalID']}/list/4001', widget.token);
    setState(() {
      doctors = data['users'];
      departmentID = doctors[0]['departmentID'];
    });
  }

  Future<void> _getAllWards() async {
    final data =
        await authFetch('ward/${widget.patient['hospitalID']}', widget.token);
    setState(() {
      wards = data['wards'];
      wardID = wards[0]['id'];
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllDoctors();
    _getAllWards();
  }

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
                DropdownButtonFormField<Map<String, dynamic>>(
                  items:
                      wards.map<DropdownMenuItem<Map<String, dynamic>>>((item) {
                    return DropdownMenuItem<Map<String, dynamic>>(
                      value: item,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          '${item['name']}',
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      wardID = value?['id'];
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text('Ward'),
                    border: OutlineInputBorder(),
                  ),
                  value: wards[0],
                ),
                const SizedBox(height: 12.0),
                DropdownButtonFormField<Map<String, dynamic>>(
                  items: doctors
                      .map<DropdownMenuItem<Map<String, dynamic>>>((item) {
                    return DropdownMenuItem<Map<String, dynamic>>(
                      value: item,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          '${item['firstName']} ${item['lastName']}',
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _doctorName =
                          '${value?['firstName']} ${value?['lastName']}';
                      departmentID = value?['departmentID'];
                    });
                  },
                  decoration: const InputDecoration(
                    label: Text('Doctor\'s Name'),
                    border: OutlineInputBorder(),
                  ),
                  value: doctors[0],
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authPatch(
                        'patient/${widget.patient['hospitalID']}/patients/${widget.patient['id']}/transfer',
                        widget.token,
                        {
                          'wardID': wardID,
                          'transferType': transferType[_transferType],
                          'bp': '$_bloodPressureHigh/$_bloodPressureLow',
                          'temp': _temperature,
                          'oxygen': _oxygen,
                          'pulse': _pulse,
                          'hospitalName': _hospitalName,
                          'reason': _reason,
                          'relativeName': _relativeName,
                          'departmentID': departmentID,
                          'userID': widget.patient['userID'],
                        },
                      );
                      setState(() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Successfully transfered patient'),
                          backgroundColor: Colors.lightGreen,
                        ));
                      });
                    } catch (e) {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Failed to transfer patient'),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ));
                      });
                      print(e);
                    }
                  }
                },
                child: load
                    ? const CircularProgressIndicator()
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
