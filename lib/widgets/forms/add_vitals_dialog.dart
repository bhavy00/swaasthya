import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_post.dart';
import 'package:intl/intl.dart';

// utility function
String formatTime(TimeOfDay time, DateTime date) {
  // Combine with the TimeOfDay to create a DateTime object
  DateTime combinedDateTime =
      DateTime(date.year, date.month, date.day, time.hour, time.minute);
  // Format the combined DateTime object into the desired format
  String formattedTimeOfDay =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(combinedDateTime);
  return formattedTimeOfDay;
}

class AddVitalsDialog extends StatefulWidget {
  final int? userID;
  final int? timelineID;
  final String? token;
  final int? hospitalID;
  const AddVitalsDialog({
    super.key,
    this.userID,
    this.timelineID,
    this.token,
    this.hospitalID,
  });

  @override
  State<AddVitalsDialog> createState() => _AddVitalsDialogState();
}

class _AddVitalsDialogState extends State<AddVitalsDialog> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool err = false;
  final _formKey = GlobalKey<FormState>();
  // Form field controllers
  final TextEditingController _heartRateController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _spo2Controller = TextEditingController();
  final TextEditingController _highBloodPressureController =
      TextEditingController();
  final TextEditingController _lowBloodPressureController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Vitals Form'),
      content: SingleChildScrollView(
        child: err
            ? const Text('Error occured')
            : Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Select Date and Time:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Select Date'),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null &&
                                  pickedDate != _selectedDate) {
                                setState(() {
                                  _selectedDate = pickedDate;
                                });
                              }
                            },
                            controller: TextEditingController(
                                text: _selectedDate.toString().split(' ')[0]),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Select Time'),
                            readOnly: true,
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context, initialTime: _selectedTime);
                              if (pickedTime != null &&
                                  pickedTime != _selectedTime) {
                                setState(() {
                                  _selectedTime = pickedTime;
                                });
                              }
                            },
                            controller: TextEditingController(
                                text:
                                    '${_selectedTime.hour}:${_selectedTime.minute}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Enter Vitals:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _heartRateController,
                        decoration: const InputDecoration(
                            labelText: 'Heart Rate', suffixText: 'bpm'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _temperatureController,
                        decoration: const InputDecoration(
                            labelText: 'Temperature', suffixText: '°C'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _spo2Controller,
                        decoration: const InputDecoration(
                            labelText: 'Oxygen', suffixText: '%'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _highBloodPressureController,
                        decoration: const InputDecoration(
                            labelText: 'High Blood Pressure',
                            suffixText: 'mmHg'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _lowBloodPressureController,
                        decoration: const InputDecoration(
                            labelText: 'Low Blood Pressure',
                            suffixText: 'mmHg'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              String time =
                                  formatTime(_selectedTime, _selectedDate);
                              await authPost(
                                'vitals/${widget.hospitalID}/${widget.timelineID}',
                                widget.token,
                                {
                                  'userID': widget.userID,
                                  "oxygen":
                                      int.parse(_spo2Controller.text.trim()),
                                  "oxygenTime": time,
                                  "pulse": int.parse(
                                      _heartRateController.text.trim()),
                                  "pulseTime": time,
                                  "temperature": int.parse(
                                      _temperatureController.text.trim()),
                                  "temperatureTime": time,
                                  "bp":
                                      '${_highBloodPressureController.text.trim()}/${_lowBloodPressureController.text.trim()}',
                                  "bpTime": time
                                },
                              );
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            setState(() {
                              err = true;
                            });
                            print(e);
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
