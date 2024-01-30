import 'package:flutter/material.dart';
import 'package:swaasthya/utils/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class BasicInformationPatientForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const BasicInformationPatientForm({super.key, required this.formKey});

  @override
  State<BasicInformationPatientForm> createState() =>
      _BasicInformationPatientFormState();
}

class _BasicInformationPatientFormState
    extends State<BasicInformationPatientForm> {
  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  @override
  Widget build(BuildContext context) {
    final MedicalHistory history = MedicalHistoryDataHolder.of(context).history;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            const Text('Select Blood group: '),
            DropdownButtonFormField(
              value: history.bloodGroup,
              items: _bloodGroups.map((group) {
                return DropdownMenuItem(
                  value: group,
                  child: Text(group),
                );
              }).toList(),
              hint: const Text('Select Blood Group'),
              onChanged: (value) {
                setState(() {
                  history.bloodGroup = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text('High BP'),
              value: history.highBp,
              onChanged: (value) {
                setState(() {
                  history.highBp = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Low BP'),
              value: history.lowBp,
              onChanged: (value) {
                setState(() {
                  history.lowBp = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Diabetes'),
              value: history.diabetes,
              onChanged: (value) {
                setState(() {
                  history.diabetes = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Surgery'),
              value: history.surgery,
              onChanged: (value) {
                setState(() {
                  history.surgery = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Hyper Lipidameia/Dyslipidaemia'),
              value: history.lipidameia,
              onChanged: (value) {
                setState(() {
                  history.lipidameia = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
