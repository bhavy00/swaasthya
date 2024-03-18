import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_post.dart';

class AddSymptomDialog extends StatefulWidget {
  final int? timelineID;
  final int? userID;
  final String? token;
  final VoidCallback onDialogClosed;
  const AddSymptomDialog({
    super.key,
    required this.timelineID,
    required this.userID,
    required this.token,
    required this.onDialogClosed,
  });

  @override
  State<AddSymptomDialog> createState() => _AddSymptomDialogState();
}

class _AddSymptomDialogState extends State<AddSymptomDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _symptomNameController;
  late TextEditingController _symptomDurationController;
  String durationParameter = 'Days';
  List<Map<String, String>> symptomsList = [];
  bool error = false;

  @override
  void initState() {
    super.initState();
    _symptomNameController = TextEditingController();
    _symptomDurationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Symptom'),
      content: error
          ? const Text('An error occured')
          : Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _symptomNameController,
                    decoration:
                        const InputDecoration(labelText: 'Symptom Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter symptom name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _symptomDurationController,
                    decoration:
                        const InputDecoration(labelText: 'Symptom Duration'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter symptom duration';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        label: Text('Duration Parameter')),
                    //isExpanded: true,
                    value: durationParameter,
                    onChanged: (String? newValue) {
                      setState(() {
                        durationParameter = newValue!;
                      });
                    },
                    items: <String>['Days', 'Weeks', 'Months', 'Years']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          symptomsList.add({
                            'symptom': _symptomNameController.text.trim(),
                            'duration': _symptomDurationController.text.trim(),
                            'durationParameter': durationParameter,
                          });
                          _symptomDurationController.text = '';
                          _symptomNameController.text = '';
                        }
                      });
                    },
                    label: const Text('Add'),
                    icon: const Icon(Icons.add),
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 5,
                    children:
                        List<Widget>.generate(symptomsList.length, (index) {
                      return InputChip(
                        label: Text(symptomsList[index]['symptom']!),
                        onDeleted: () {
                          setState(() {
                            symptomsList.removeAt(index);
                          });
                        },
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                      );
                    }),
                  )
                ],
              ),
            ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            try {
              await authPost('symptom', widget.token, {
                'timeLineID': widget.timelineID,
                'userID': widget.userID,
                'symptoms': symptomsList
              });
              widget.onDialogClosed();
              Navigator.of(context).pop();
            } catch (e) {
              print(e);
              setState(() {
                error = true;
              });
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
    );
  }
}
