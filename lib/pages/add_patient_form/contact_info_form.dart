import 'package:flutter/material.dart';
import 'package:swaasthya/utils/patient_class.dart';
import 'package:swaasthya/utils/patient_data_holder.dart';

class ContactInfoForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ContactInfoForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final Patient patient = PatientDataHolder.of(context).patient;
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => patient.email = value!,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              }
              // Add additional email validation if needed
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
            onSaved: (value) => patient.phoneNumber = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Address'),
            onSaved: (value) => patient.address = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'State'),
            onSaved: (value) => patient.state = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'City'),
            onSaved: (value) => patient.city = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Pincode'),
            keyboardType: TextInputType.number,
            onSaved: (value) => patient.pincode = value!,
          ),
        ],
      ),
    );
  }
}
