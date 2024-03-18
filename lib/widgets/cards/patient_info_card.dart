import 'package:flutter/material.dart';

class PatientInfoCard extends StatelessWidget {
  final dynamic patient;
  const PatientInfoCard({super.key, required this.patient});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Image on the left
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: patient['photo'] == null
                      ? const NetworkImage(
                          'https://placekitten.com/80/80', // Replace with your image URL
                        )
                      : NetworkImage(patient['photo']),
                ),
              ),
            ),
            const SizedBox(width: 16.0), // Add spacing between image and text
            // Other information on the right
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${patient['pName']}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  patient['doctorName'] as String,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${patient['startTime'].split('T')[0]}',
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
