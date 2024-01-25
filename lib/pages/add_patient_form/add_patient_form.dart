import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_patient_form/basic_info_form.dart';
import 'package:swaasthya/pages/add_patient_form/contact_info_form.dart';
import 'package:swaasthya/pages/add_patient_form/doctor_info_form.dart';
import 'package:swaasthya/utils/patient_class.dart';
import 'package:swaasthya/utils/patient_data_holder.dart';

class AddPatientForm extends StatefulWidget {
  const AddPatientForm({super.key});

  @override
  State<AddPatientForm> createState() => _AddPatientFormState();
}

class _AddPatientFormState extends State<AddPatientForm> {
  //final _formKey = GlobalKey<FormState>();
  final Patient patient = Patient();
  void onDataChange(String trigger, dynamic data) {
    if (trigger == 'name') {
      patient.name = data;
    }
  }

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < 2) {
          setState(() {
            _currentStep += 1;
          });
        } else {
          printPatient(patient);
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Add Patient'),
                  content: Column(
                    children: [
                      Text('Patient Info'),
                    ],
                  ),
                );
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
            child: const BasicInfoForm(),
          ),
          isActive: _currentStep >= 0,
          state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text('Patient\'s Contact Information'),
          content: PatientDataHolder(
            patient: patient,
            child: const ContactInfoForm(),
          ),
          isActive: _currentStep >= 1,
          state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text('Doctor\'s Information'),
          content: PatientDataHolder(
            patient: patient,
            child: const DoctorInfoForm(),
          ),
          isActive: _currentStep >= 2,
          state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
        ),
      ],
    );
  }
}
