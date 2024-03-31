import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class PatientHealthConditionForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientHealthConditionForm({super.key, required this.formKey});

  @override
  State<PatientHealthConditionForm> createState() =>
      _PatientHealthConditionFormState();
}

class _PatientHealthConditionFormState
    extends State<PatientHealthConditionForm> {
  @override
  Widget build(BuildContext context) {
    final MedicalHistory history = MedicalHistoryDataHolder.of(context).history;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Text('Does patient have any of the following condition?'),
          const SizedBox(
            height: 4,
          ),
          CheckboxListTile(
            title: const Text('Heart'),
            value: history.heart,
            onChanged: (value) {
              setState(() {
                history.heart = value!;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          if (history.heart) ...[
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Heart Disease Name'),
              keyboardType: TextInputType.multiline,
              onSaved: (value) => history.heartDiseases = value!,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
          CheckboxListTile(
            title: const Text('Mental'),
            value: history.mental,
            onChanged: (value) {
              setState(() {
                history.mental = value!;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          if (history.mental) ...[
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Mental health condition'),
              keyboardType: TextInputType.multiline,
              onSaved: (value) => history.mentalHealth = value!,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
          TextFormField(
            decoration:
                const InputDecoration(labelText: 'Neurological Disorder'),
            keyboardType: TextInputType.multiline,
            onSaved: (value) => history.neurologicalDisorder,
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
            title: const Text('Chest'),
            value: history.chest,
            onChanged: (value) {
              setState(() {
                history.chest = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Epilepsy'),
            value: history.epilepsy,
            onChanged: (value) {
              setState(() {
                history.epilepsy = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Bone/joint'),
            value: history.bone,
            onChanged: (value) {
              setState(() {
                history.bone = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
