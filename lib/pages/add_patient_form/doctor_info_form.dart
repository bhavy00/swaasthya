import 'package:flutter/material.dart';

class DoctorInfo {
  String doctorName = '';
  String referredBy = '';
}

class DoctorInfoForm extends StatelessWidget {
  const DoctorInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final DoctorInfo patient = DoctorInfo();
    return Form(
      key: formkey,
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
