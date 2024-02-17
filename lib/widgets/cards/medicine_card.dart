import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String medicineName;
  final String duration;
  final int numberOfDoses;
  final String medicationTime;
  final String notes;
  final double progress;

  const MedicineCard({
    super.key,
    required this.medicineName,
    required this.duration,
    required this.numberOfDoses,
    required this.medicationTime,
    required this.notes,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width >= 600 ? 350 : 450),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medicine Name: $medicineName',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 8),
              Text(
                'Progress: ${(progress * 100).toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
