import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/medical_history_class.dart';
import 'package:swaasthya/utils/medical_history_data_holder.dart';

class PatientAllergyForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PatientAllergyForm({super.key, required this.formKey});

  @override
  State<PatientAllergyForm> createState() => _PatientAllergyFormState();
}

class _PatientAllergyFormState extends State<PatientAllergyForm> {
  @override
  Widget build(BuildContext context) {
    final MedicalHistory history = MedicalHistoryDataHolder.of(context).history;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Text('Does patient have any of the followign allergies?'),
          const SizedBox(
            height: 4,
          ),
          CheckboxListTile(
            title: const Text('Food Allergy'),
            value: history.foodAllergy,
            onChanged: (value) {
              setState(() {
                history.foodAllergy = value!;
              });
            },
            
          ),
          if (history.foodAllergy) ...[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Food Items'),
              keyboardType: TextInputType.multiline,
              onSaved: (value) => history.foodAllergyList = value!,
              initialValue: history.foodAllergyList,
            )
          ],
          CheckboxListTile(
            title: const Text('Medicine Allergy'),
            value: history.medicineAllergy,
            onChanged: (value) {
              setState(() {
                history.medicineAllergy = value!;
              });
            },
          ),
          if (history.medicineAllergy) ...[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Medicines'),
              keyboardType: TextInputType.multiline,
              onSaved: (value) => history.medicineAllergyList = value!,
              initialValue: history.medicineAllergyList,
            )
          ],
          CheckboxListTile(
            title: const Text('Anesthesia Allergy'),
            value: history.anesthesiaAllergy,
            onChanged: (value) {
              setState(() {
                history.anesthesiaAllergy = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
