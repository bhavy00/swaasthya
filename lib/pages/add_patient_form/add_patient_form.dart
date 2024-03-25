import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_post.dart';
import 'package:swaasthya/pages/add_patient_form/basic_info_form.dart';
import 'package:swaasthya/pages/add_patient_form/contact_info_form.dart';
import 'package:swaasthya/pages/add_patient_form/doctor_info_form.dart';
import 'package:swaasthya/utils/classes/patient_class.dart';
import 'package:swaasthya/utils/patient_data_holder.dart';

class AddPatientForm extends StatefulWidget {
  final int? hospitalID;
  final String? token;
  final int patientStatus;
  final int? userID;
  final int? departmentID;
  const AddPatientForm({
    super.key,
    this.hospitalID,
    this.token,
    required this.patientStatus,
    this.userID,
    this.departmentID,
  });

  @override
  State<AddPatientForm> createState() => _AddPatientFormState();
}

class _AddPatientFormState extends State<AddPatientForm> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  late Patient patient = Patient(
    userID: widget.userID,
    hospitalID: widget.hospitalID,
    ptype: widget.patientStatus,
    departmentID: widget.departmentID,
  );
  int _currentStep = 0;
  bool err = false, load = false, added = false;
  void _addPatient(Patient body) async {
    try {
      await authPost(
          'patient/${widget.hospitalID}/patients', widget.token, body.toMap());
    } catch (e) {
      setState(() {
        err = true;
      });
      print('$err cdsva $e ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient'),
        centerTitle: true,
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          bool isStepValid = true;
          switch (_currentStep) {
            case 0:
              isStepValid = _formKey1.currentState!.validate();
              if (isStepValid) {
                _formKey1.currentState!.save();
              }
              break;
            case 1:
              isStepValid = _formKey2.currentState!.validate();
              if (isStepValid) {
                _formKey2.currentState!.save();
              }
              break;
            case 2:
              isStepValid = _formKey3.currentState!.validate();
              if (isStepValid) {
                _formKey3.currentState!.save();
                //printPatient(patient);
              }
              break;
          }
          if (isStepValid) {
            setState(() {
              if (_currentStep < 2) {
                _currentStep++;
              } else {
                printPatient(patient);
                _addPatient(patient);
                print(err);
                err
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'Failed to add Patient, please try again later'),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      )
                    : showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDialog(
                            title: const Text('Patient added'),
                            content: const Text('Patient added successfully'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Add Medical History')),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Add Symptoms'))
                            ],
                          );
                        });
              }
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: const Text('Patient\'s Basic Information'),
            content: PatientDataHolder(
              patient: patient,
              child: BasicInfoForm(
                formKey: _formKey1,
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Patient\'s Contact Information'),
            content: PatientDataHolder(
              patient: patient,
              child: ContactInfoForm(
                formKey: _formKey2,
              ),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Doctor\'s Information'),
            content: PatientDataHolder(
              patient: patient,
              child: DoctorInfoForm(
                formKey: _formKey3,
              ),
            ),
            isActive: _currentStep >= 2,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
