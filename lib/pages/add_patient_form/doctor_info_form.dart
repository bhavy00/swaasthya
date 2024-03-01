import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/patient_class.dart';
import 'package:swaasthya/utils/patient_data_holder.dart';

class DoctorInfoForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const DoctorInfoForm({super.key, required this.formKey});

  @override
  State<DoctorInfoForm> createState() => _DoctorInfoFormState();
}

class _DoctorInfoFormState extends State<DoctorInfoForm> {
  String _ward = 'General Ward';
  @override
  Widget build(BuildContext context) {
    final Patient patient = PatientDataHolder.of(context).patient;
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            const SizedBox(
              height: 8,
            ),
            DropdownButtonFormField<String>(
              items: <String>['General Ward', 'Private Ward', 'ICU', 'NICU']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _ward = value!;
                  patient.ward = _ward;
                });
              },
              decoration: const InputDecoration(
                label: Text('Ward'),
                border: OutlineInputBorder(),
              ),
              value: _ward,
            ),
            const SizedBox(
              height: 8,
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
      ),
    );
  }
}
