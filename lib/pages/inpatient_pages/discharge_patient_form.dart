import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_post.dart';
import 'package:swaasthya/pages/welcome_page.dart';
import 'package:swaasthya/utils/types_and_category.dart';
import 'package:intl/intl.dart';

class DischargePatientForm extends StatefulWidget {
  final String? token;
  final int? hospitalID;
  final int? patientID;
  const DischargePatientForm(
      {super.key, this.token, this.hospitalID, this.patientID});

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
  DateTime _followupDate = DateTime.now();

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
                decoration: const InputDecoration(labelText: 'FollowUp Date'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _followupDate = pickedDate;
                    });
                  }
                },
                controller: TextEditingController(
                    text: _followupDate.toString().split(' ')[0]),
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authPost(
                        'patient/${widget.hospitalID}/patients/discharge/${widget.patientID}',
                        widget.token,
                        {
                          'dischargeType': dischargeType[_reasonForDischarge],
                          'advice': _adviceOnDischarge,
                          'followUpDate': _followupRequired == 'Yes'
                              ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                                  .format(_followupDate)
                              : "",
                          'followUp': _followupRequired == 'Yes' ? 1 : 0,
                          'diet': _diet
                        },
                      );
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (builder) {
                            return AlertDialog(
                              title: const Text('Patient Discharge'),
                              content:
                                  const Text('Patient Discharged Successfully'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: ((context) {
                                      return const WelcomePage();
                                    })));
                                  },
                                  child: const Text('Ok'),
                                )
                              ],
                            );
                          },
                        );
                      });
                    } catch (e) {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Failed to discharge patient'),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ));
                      });
                      //print(e);
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
