import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String? medicineName;
  final int? duration;
  final int? numberOfDoses;
  final String? medicationTime;
  final String? notes;

  const MedicineCard({
    super.key,
    required this.medicineName,
    required this.duration,
    required this.numberOfDoses,
    required this.medicationTime,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width >= 600 ? 350 : 450),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            title: Text(
              'Medicine Name: $medicineName',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Duration: $duration',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'No of Doses: $numberOfDoses',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Medication Time: $medicationTime',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Notes: $notes',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
