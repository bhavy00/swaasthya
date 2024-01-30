import 'package:flutter/material.dart';
import 'package:swaasthya/utils/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class HistoryProviderDetailsForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  const HistoryProviderDetailsForm({super.key, required this.formkey});

  @override
  State<HistoryProviderDetailsForm> createState() =>
      _HistoryProviderDetailsFormState();
}

class _HistoryProviderDetailsFormState
    extends State<HistoryProviderDetailsForm> {
  @override
  Widget build(BuildContext context) {
    final MedicalHistory history = MedicalHistoryDataHolder.of(context).history;
    return Form(
      key: widget.formkey,
      child: Column(
        children: [
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'Patient history given by'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter patient history giver\'s name';
              }
              return null;
            },
            onSaved: (newValue) => history.name = newValue!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Phone number'),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter phone number';
              }
              return null;
            },
            onSaved: (newValue) => history.phoneNumber = newValue!,
          ),
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'Relationship with patient'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter relationship with patient';
              }
              return null;
            },
            onSaved: (newValue) => history.relationship = newValue!,
          ),
        ],
      ),
    );
  }
}
