import 'package:flutter/material.dart';
import 'package:swaasthya/utils/patient_class.dart';
import 'package:swaasthya/utils/patient_data_holder.dart';

class DoctorInfoForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const DoctorInfoForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final Patient patient = PatientDataHolder.of(context).patient;
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
            onSaved: (value) => patient.doctorName = value!,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Referred By'),
            onSaved: (value) => patient.referredBy = value!,
            validator: (value) {
              if (value!.isEmpty) {
                return 'reference is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
