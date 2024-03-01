import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_medical_history_form/basic_information_patient_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/history_provider_details_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/misc_info_patient_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_addictions_infections_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_allergy_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_health_condition_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_medication_form.dart';
import 'package:swaasthya/utils/classes/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class AddMedicalHistoryForm extends StatefulWidget {
  const AddMedicalHistoryForm({super.key});

  @override
  State<AddMedicalHistoryForm> createState() => _AddMedicalHistoryFormState();
}

class _AddMedicalHistoryFormState extends State<AddMedicalHistoryForm> {
  int _currentStep = 0;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();

  final MedicalHistory history = MedicalHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medical History'),
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
              }
              break;
            case 3:
              isStepValid = _formKey4.currentState!.validate();
              if (isStepValid) {
                _formKey4.currentState!.save();
              }
              break;
            case 4:
              isStepValid = _formKey5.currentState!.validate();
              if (isStepValid) {
                _formKey5.currentState!.save();
              }
              break;
            case 5:
              isStepValid = _formKey6.currentState!.validate();
              if (isStepValid) {
                _formKey6.currentState!.save();
              }
              break;
            case 6:
              isStepValid = _formKey7.currentState!.validate();
              if (isStepValid) {
                _formKey7.currentState!.save();
              }
              break;
          }
          if (isStepValid) {
            setState(() {
              if (_currentStep < 6) {
                _currentStep++;
              } else {
                history.printAllValues();
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Add Patient Medical History'),
                        content: const Text(
                            'Are you sure you want to add the patient\'s medical history?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Edit',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
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
            title: const Text('Information provider details'),
            content: MedicalHistoryDataHolder(
              history: history,
              child: HistoryProviderDetailsForm(
                formkey: _formKey1,
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Basic information about patient'),
            content: MedicalHistoryDataHolder(
              history: history,
              child: BasicInformationPatientForm(
                formKey: _formKey2,
              ),
            ),
            isActive: _currentStep >= 1,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Patient\'s Allergies'),
            content: MedicalHistoryDataHolder(
              history: history,
              child: PatientAllergyForm(
                formKey: _formKey3,
              ),
            ),
            isActive: _currentStep >= 2,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Patient\'s medication history'),
            content: MedicalHistoryDataHolder(
              history: history,
              child: PatientMedicationForm(
                formKey: _formKey4,
              ),
            ),
            isActive: _currentStep >= 3,
            state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Patient\'s health conditions'),
            content: MedicalHistoryDataHolder(
              history: history,
              child: PatientHealthConditionForm(
                formKey: _formKey5,
              ),
            ),
            isActive: _currentStep >= 4,
            state: _currentStep >= 4 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Patient\'s addictions and infections'),
            content: MedicalHistoryDataHolder(
              history: history,
              child: PatientAddictionInfectionForm(
                formKey: _formKey6,
              ),
            ),
            isActive: _currentStep >= 5,
            state: _currentStep >= 5 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Miscellaneous'),
            content: MedicalHistoryDataHolder(
              history: history,
              child: MiscInfoPatient(
                formKey: _formKey7,
              ),
            ),
            isActive: _currentStep >= 6,
            state: _currentStep >= 6 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
