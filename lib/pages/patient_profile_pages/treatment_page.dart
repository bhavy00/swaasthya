import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/add_medicine_dialog.dart';
import 'package:swaasthya/widgets/medicine_card.dart';

List<Map<String, dynamic>> treat = [
  {
    'medicineName': 'Paracetamol',
    'duration': '7 days',
    'numberOfDoses': 3,
    'medicationTime': 'After meal',
    'notes': 'Take with water',
    'progress': 0.7, // 70% progress
  },
  {
    'medicineName': 'Test Medicine 2',
    'duration': '4 days',
    'numberOfDoses': 1,
    'medicationTime': 'Before meal',
    'notes': 'Take with water',
    'progress': 0.4, // 70% progress
  },
  {
    'medicineName': 'Test Medicine 3',
    'duration': '15 days',
    'numberOfDoses': 3,
    'medicationTime': 'After meal',
    'notes': 'Take with water',
    'progress': 0.0, // 70% progress
  },
  {
    'medicineName': 'Test Medicine 3',
    'duration': '15 days',
    'numberOfDoses': 3,
    'medicationTime': 'After meal',
    'notes': 'Take with water',
    'progress': 0.0, // 70% progress
  },
  {
    'medicineName': 'Test Medicine 3',
    'duration': '15 days',
    'numberOfDoses': 3,
    'medicationTime': 'After meal',
    'notes': 'Take with water',
    'progress': 0.0, // 70% progress
  },
  {
    'medicineName': 'Test Medicine 3',
    'duration': '15 days',
    'numberOfDoses': 3,
    'medicationTime': 'After meal',
    'notes': 'Take with water',
    'progress': 0.0, // 70% progress
  },
];

enum Types { capsules, syrups, tablets, injections, ivline }

class TreatmentPage extends StatefulWidget {
  const TreatmentPage({super.key});

  @override
  State<TreatmentPage> createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {
  Types typeView = Types.capsules;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SegmentedButton<Types>(
            segments: const <ButtonSegment<Types>>[
              ButtonSegment<Types>(
                value: Types.capsules,
                label: Text(
                  'Capsules',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ButtonSegment<Types>(
                value: Types.syrups,
                label: Text(
                  'Syrups',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ButtonSegment<Types>(
                value: Types.tablets,
                label: Text(
                  'Tablets',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ButtonSegment<Types>(
                value: Types.injections,
                label: Text(
                  'Injections',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ButtonSegment<Types>(
                value: Types.ivline,
                label: Text(
                  'IV Line',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            selected: <Types>{typeView},
            onSelectionChanged: (Set<Types> newSelection) {
              setState(() {
                typeView = newSelection.first;
              });
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Medicine'),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AddMedicineDialog();
                      });
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: treat.length,
                  itemBuilder: ((context, index) {
                    final treatment = treat[index];
                    return MedicineCard(
                      medicineName: treatment['medicineName'],
                      medicationTime: treatment['medicationTime'],
                      numberOfDoses: treatment['numberOfDoses'],
                      duration: treatment['duration'],
                      notes: treatment['notes'],
                      progress: treatment['progress'],
                    );
                  }),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text('Add Notification for Medicine'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [],
                                ),
                              );
                            });
                      },
                      tooltip: 'Add Notification for medicine',
                      label: const Text('Add Notification'),
                      icon: const Icon(Icons.notification_add),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
