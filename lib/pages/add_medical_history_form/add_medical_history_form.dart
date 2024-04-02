import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/apis/use_auth_patch.dart';
import 'package:swaasthya/apis/use_auth_post.dart';
import 'package:swaasthya/pages/add_medical_history_form/basic_information_patient_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/history_provider_details_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/misc_info_patient_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_addictions_infections_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_allergy_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_health_condition_form.dart';
import 'package:swaasthya/pages/add_medical_history_form/patient_medication_form.dart';
import 'package:swaasthya/utils/classes/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';

class AddMedicalHistoryForm extends ConsumerStatefulWidget {
  final dynamic patient;
  final String? token;
  final bool isEdit;
  final MedicalHistory? editData;
  const AddMedicalHistoryForm({
    super.key,
    this.patient,
    this.token,
    required this.isEdit,
    this.editData,
  });

  @override
  ConsumerState<AddMedicalHistoryForm> createState() =>
      _AddMedicalHistoryFormState();
}

class _AddMedicalHistoryFormState extends ConsumerState<AddMedicalHistoryForm> {
  int _currentStep = 0;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();

  final MedicalHistory history = MedicalHistory();
  String drugs = '', infection = '', disease = '';

  void _addMedicalHistory() async {
    try {
      await authPost(
        'history/${widget.patient['hospitalID']}/patient/${widget.patient['id']}',
        widget.token,
        {
          'patientID': widget.patient['id'],
          'userID': ref.read(userProvider)?.id,
          'givenName': history.givenName,
          'givenPhone': history.givenPhone,
          'givenRelation': history.givenRelation,
          'bloodGroup': history.bloodGroup,
          'bloodPressure': history.highBp
              ? 'Yes'
              : history.lowBp
                  ? 'Yes'
                  : 'No',
          'disease': disease,
          'foodAllergy': history.foodAllergyList,
          'medicineAllergy': history.medicineAllergyList,
          'anaesthesia': history.anesthesiaAllergy ? 'Yes' : '',
          'meds': history.prescribedMedicineList,
          'selfMeds': history.selfMedicineList,
          'chestCondition': history.chestCondition,
          'neurologicalDisorder': history.neurologicalDisorder,
          'heartProblems': history.heartDiseases,
          'infections': infection,
          'mentalHealth': history.mentalHealth,
          'drugs': drugs,
          'pregnant': history.pregnant ? 'Yes' : '',
          'hereditaryDisease': history.geneticDiseasesList,
          'lumps': history.lumps ? 'Yes' : '',
          'cancer': history.cancer ? 'Yes' : '',
        },
      );
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Medical History added successfully'),
            backgroundColor: Colors.lightGreen,
          ),
        );
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Failed to add medical history, please try again later'),
            backgroundColor: Colors.red,
          ),
        );
      });
      print(e);
    }
  }

  void _editMedicalHistory() async {
    try {
      final userID = ref.read(userProvider)?.id;
      await authPatch(
        'history/${widget.patient['hospitalID']}/patient/${widget.patient['id']}/$userID}',
        widget.token,
        {
          'patientID': widget.patient['id'],
          'userID': userID,
          'givenName': widget.editData?.givenName,
          'givenPhone': widget.editData?.givenPhone,
          'givenRelation': widget.editData?.givenRelation,
          'bloodGroup': widget.editData?.bloodGroup,
          'bloodPressure': widget.editData!.highBp
              ? 'Yes'
              : widget.editData!.lowBp
                  ? 'Yes'
                  : 'No',
          'disease': disease,
          'foodAllergy': widget.editData?.foodAllergyList,
          'medicineAllergy': widget.editData?.medicineAllergyList,
          'anaesthesia': widget.editData!.anesthesiaAllergy ? 'Yes' : '',
          'meds': widget.editData?.prescribedMedicineList,
          'selfMeds': widget.editData?.selfMedicineList,
          'chestCondition': widget.editData?.chestCondition,
          'neurologicalDisorder': widget.editData?.neurologicalDisorder,
          'heartProblems': widget.editData?.heartDiseases,
          'infections': infection,
          'mentalHealth': widget.editData?.mentalHealth,
          'drugs': drugs,
          'pregnant': widget.editData!.pregnant ? 'Yes' : '',
          'hereditaryDisease': widget.editData?.geneticDiseasesList,
          'lumps': widget.editData!.lumps ? 'Yes' : '',
          'cancer': widget.editData!.cancer ? 'Yes' : '',
        },
      );
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Medical History updated successfully'),
            backgroundColor: Colors.lightGreen,
          ),
        );
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Failed to update medical history, please try again later'),
            backgroundColor: Colors.red,
          ),
        );
      });
      print(e);
    }
  }

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
                if (widget.isEdit) {
                  widget.editData!.alcohol ? drugs += 'alcohol' : '';
                  widget.editData!.tobacco ? drugs += 'tobacco' : '';
                  widget.editData!.drugs ? drugs += 'drugs' : '';
                  widget.editData!.diabetes ? disease += 'diabetes' : '';
                  widget.editData!.lipidameia
                      ? disease += 'Hyper Lipidaemia / Dyslipidaemia'
                      : '';
                  widget.editData!.surgery
                      ? disease += 'Been through any Surgery'
                      : '';
                  widget.editData!.epilepsy ? disease += 'Epilepsy' : '';
                  widget.editData!.bone ? disease += 'bone/joint' : '';
                  widget.editData!.hiv ? infection += 'HIV' : '';
                  widget.editData!.hepatitisB ? infection += 'Hepatitis B' : '';
                  widget.editData!.hepatitisC ? infection += 'Hepatitis C' : '';
                  _editMedicalHistory();
                } else {
                  history.alcohol ? drugs += 'alcohol' : '';
                  history.tobacco ? drugs += 'tobacco' : '';
                  history.drugs ? drugs += 'drugs' : '';
                  history.diabetes ? disease += 'diabetes' : '';
                  history.lipidameia
                      ? disease += 'Hyper Lipidaemia / Dyslipidaemia'
                      : '';
                  history.surgery ? disease += 'Been through any Surgery' : '';
                  history.epilepsy ? disease += 'Epilepsy' : '';
                  history.bone ? disease += 'bone/joint' : '';
                  history.hiv ? infection += 'HIV' : '';
                  history.hepatitisB ? infection += 'Hepatitis B' : '';
                  history.hepatitisC ? infection += 'Hepatitis C' : '';
                  _addMedicalHistory();
                }
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
              history: widget.isEdit ? widget.editData! : history,
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
              history: widget.isEdit ? widget.editData! : history,
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
              history: widget.isEdit ? widget.editData! : history,
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
              history: widget.isEdit ? widget.editData! : history,
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
              history: widget.isEdit ? widget.editData! : history,
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
              history: widget.isEdit ? widget.editData! : history,
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
              history: widget.isEdit ? widget.editData! : history,
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
