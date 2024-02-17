import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/forms/add_medicine_dialog.dart';
import 'package:swaasthya/widgets/cards/medicine_card.dart';

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
    return SingleChildScrollView(
      child: Padding(
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
            Stack(
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    treat.length,
                    (index) {
                      final treatment = treat[index];
                      return MedicineCard(
                        medicineName: treatment['medicineName'],
                        medicationTime: treatment['medicationTime'],
                        numberOfDoses: treatment['numberOfDoses'],
                        duration: treatment['duration'],
                        notes: treatment['notes'],
                        progress: treatment['progress'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
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
