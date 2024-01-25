import 'package:flutter/material.dart';

class ContactInfo {
  String email = '';
  String phoneNumber = '';
  String address = '';
  String state = '';
  String city = '';
  String pincode = '';
}

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactInfo patient = ContactInfo();
    final formkey = GlobalKey<FormState>();
    return Form(
      key: formkey,
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
