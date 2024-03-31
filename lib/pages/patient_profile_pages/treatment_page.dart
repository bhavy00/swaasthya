import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/widgets/forms/add_medicine_dialog.dart';
import 'package:swaasthya/widgets/filter_chip_widget.dart';
import 'package:swaasthya/widgets/futureBuilderWidgets/medicine_list_widget.dart';
import 'package:swaasthya/widgets/futureBuilderWidgets/medicine_reminder_list_widget.dart';

class TreatmentPage extends StatefulWidget {
  final dynamic patient;
  final String? token;
  const TreatmentPage({super.key, this.patient, this.token});

  @override
  State<TreatmentPage> createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {
  bool showFilter = false;
  bool medicineAdded = false;
  String view = 'Medicine';
  void medicineAddedCallback() {
    setState(() {
      medicineAdded = true;
    });
  }

  Future<List<dynamic>> _getAllMedicines() async {
    final data = await authFetch(
        'medicine/${widget.patient['patientTimeLineID']}', widget.token);
    return data['medicines'];
  }

  Future<List<dynamic>> _getAllMedicinesReminders() async {
    final data = await authFetch(
        'medicine/${widget.patient['patientTimeLineID']}/reminders/all',
        widget.token);
    return data['reminders'];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SegmentedButton<String>(
                  segments: const <ButtonSegment<String>>[
                    ButtonSegment<String>(
                      value: 'Medicine',
                      label: Text('Medicine'),
                    ),
                    ButtonSegment<String>(
                      value: 'Reminder',
                      label: Text('Reminder'),
                    ),
                  ],
                  selected: <String>{view},
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      view = newSelection.first;
                    });
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showFilter = !showFilter;
                        });
                      },
                      icon: const Icon(Icons.filter_alt),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AddMedicineDialog(
                                patient: widget.patient,
                                medicineAdded: medicineAddedCallback,
                                token: widget.token,
                              );
                            });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
            if (showFilter) ...[
              const FilterChipClass(filters: [
                'All',
                'Capsules',
                'Syrups',
                'Tablets',
                'Injections',
                'IV Line'
              ])
            ],
            const SizedBox(
              height: 15,
            ),
            view == 'Medicine'
                ? MedicineListWidget(getAllMedicines: _getAllMedicines)
                : MedicineRemindersListWidget(
                    getAllMedicineReminders: _getAllMedicinesReminders)
          ],
        ),
      ),
    );
  }
}
