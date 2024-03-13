import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:swaasthya/utils/classes/patient_class.dart';
import 'package:swaasthya/utils/patient_data_holder.dart';

class BasicInfoForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const BasicInfoForm({super.key, required this.formKey});

  @override
  State<BasicInfoForm> createState() => _BasicInfoFormState();
}

class _BasicInfoFormState extends State<BasicInfoForm> {
  File? _image;

  final picker = ImagePicker();
  Future getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String category = 'Adult';
  @override
  Widget build(BuildContext context) {
    final Patient patient = PatientDataHolder.of(context).patient;
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              items: <String>['Adult', 'Neonate', 'Child']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  category = value!;
                  patient.category = category;
                });
              },
              decoration: const InputDecoration(
                label: Text('Category'),
                border: OutlineInputBorder(),
              ),
              value: category,
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onSaved: (value) => patient.name = value!,
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
            TextFormField(
              decoration: const InputDecoration(labelText: 'ID'),
              onSaved: (value) => patient.id = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ID is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'UHID'),
              onSaved: (value) => patient.uhid = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'UHID is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Height'),
              keyboardType: TextInputType.number,
              onSaved: (value) => patient.height = double.parse(value!),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Height is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
              onSaved: (value) => patient.weight = double.parse(value!),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Weight is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Gender'),
              onSaved: (value) => patient.gender = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Gender is required';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Date of Birth'),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null && pickedDate != patient.dob) {
                  setState(() {
                    patient.dob = pickedDate;
                  });
                }
              },
              controller: TextEditingController(
                  text: patient.dob.toString().split(' ')[0]),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Upload Photo: '),
                Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        getImage(ImageSource.gallery);
                      },
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Gallery'),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        getImage(ImageSource.camera);
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Camera'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
