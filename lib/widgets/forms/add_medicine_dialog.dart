import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_post.dart';
import 'package:swaasthya/pages/patient_profile_pages/treatment_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';

class AddMedicineDialog extends ConsumerStatefulWidget {
  final dynamic patient;
  final VoidCallback medicineAdded;
  final String? token;
  const AddMedicineDialog({
    super.key,
    this.patient,
    required this.medicineAdded,
    this.token,
  });

  @override
  ConsumerState<AddMedicineDialog> createState() => _AddMedicineDialogState();
}

class _AddMedicineDialogState extends ConsumerState<AddMedicineDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _medicineNameController;
  late TextEditingController _durationController;
  //late TextEditingController _numberOfDosesController;
  //late TextEditingController _notesController;
  String type = 'Capsules';
  String time = 'Before Meal';
  int numberOfDose = 0;
  final List<TimeOfDay> _doseTimings = [];
  final List<String> notes = [];
  TimeOfDay timeOfDose = TimeOfDay.now();
  List<Map<String, dynamic>> medicineList = [];
  bool error = false;

  @override
  void initState() {
    super.initState();
    _medicineNameController = TextEditingController();
    _durationController = TextEditingController();
    // _numberOfDosesController = TextEditingController();
    //_notesController = TextEditingController();
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _durationController.dispose();
    // _numberOfDosesController.dispose();
    //_notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Medicine Treatment'),
          centerTitle: true,
        ),
        body: error
            ? const Center(child: Text('An Error Occured'))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButtonFormField<String>(
                          items: <String>[
                            'Capsules',
                            'Syrups',
                            'Tablets',
                            'Injections',
                            'IV Line'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              type = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            label: Text('Type'),
                            border: OutlineInputBorder(),
                          ),
                          value: type,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _medicineNameController,
                          decoration:
                              const InputDecoration(labelText: 'Medicine Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter medicine name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _durationController,
                          decoration: const InputDecoration(
                              labelText: 'Duration',
                              hintText: 'number of days',
                              suffixText: 'Days'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter duration';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Number of Doses: '),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    numberOfDose += 1;
                                    _doseTimings.add(TimeOfDay.now());
                                    notes.add('');
                                  });
                                },
                                icon: const Icon(Icons.add)),
                            Text('$numberOfDose'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    numberOfDose -= 1;
                                    _doseTimings.removeLast();
                                    notes.removeLast();
                                  });
                                },
                                icon: const Icon(Icons.remove))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField<String>(
                          items: <String>[
                            'Before Meal',
                            'After Meal',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              time = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            label: Text('Medication Time'),
                            border: OutlineInputBorder(),
                          ),
                          value: time,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            numberOfDose,
                            (index) {
                              return Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText:
                                            'Select Dose ${index + 1} Time'),
                                    readOnly: true,
                                    onTap: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: timeOfDose);
                                      if (pickedTime != null) {
                                        setState(() {
                                          _doseTimings[index] = pickedTime;
                                        });
                                      }
                                    },
                                    controller: TextEditingController(
                                        text:
                                            '${timeOfDose.hour}:${timeOfDose.minute}'),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    onChanged: (value) {
                                      setState(() {
                                        notes[index] = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Dose ${index + 1} Notes'),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                medicineList.add({
                                  'timeLineID':
                                      widget.patient['patientTimeLineID'],
                                  'userID': ref.read(userProvider)?.id,
                                  'medicineType': medicineCategory[type],
                                  'medicineName':
                                      _medicineNameController.text.trim(),
                                  'daysCount': int.parse(
                                      _durationController.text.trim()),
                                  'doseCount': numberOfDose,
                                  'medicationTime': time,
                                  'doseTimings': _doseTimings.join(', '),
                                  'notes': notes.join(','),
                                });
                                _durationController.text = '';
                                _medicineNameController.text = '';
                                numberOfDose = 0;
                              }
                            });
                          },
                          label: const Text('Add'),
                          icon: const Icon(Icons.add),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 5,
                          children: List<Widget>.generate(
                            medicineList.length,
                            (index) {
                              return InputChip(
                                label:
                                    Text(medicineList[index]['medicineName']!),
                                onDeleted: () {
                                  setState(() {
                                    medicineList.removeAt(index);
                                  });
                                },
                                backgroundColor:
                                    Theme.of(context).colorScheme.background,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: medicineList.isEmpty
                  ? null
                  : () async {
                      //print(medicineList);
                      try {
                        await authPost(
                          'medicine',
                          widget.token,
                          {'medicines': medicineList},
                        );
                        widget.medicineAdded();
                        setState(() {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Medicine added successfully'),
                            backgroundColor: Colors.lightGreen,
                          ));
                        });
                      } catch (e) {
                        setState(() {
                          error = true;
                        });
                        //print(e);
                      }
                    },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        ));
  }
}
