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

class TreatmentPage extends StatefulWidget {
  const TreatmentPage({super.key});

  @override
  State<TreatmentPage> createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {
  bool showFilter = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Medicine'),
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
                            return const AddMedicineDialog();
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

class FilterChipClass extends StatefulWidget {
  final List<String> filters;
  const FilterChipClass({super.key, required this.filters});

  @override
  State<FilterChipClass> createState() => _FilterChipClassState();
}

class _FilterChipClassState extends State<FilterChipClass> {
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 5.0,
            alignment: WrapAlignment.start,
            children: widget.filters.map((filter) {
              return FilterChip(
                label: Text(filter),
                selected: selectedFilter == filter,
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = selected ? filter : '';
                    // print(selectedFilter);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
