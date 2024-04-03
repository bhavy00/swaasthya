import 'package:flutter/material.dart';
import 'package:swaasthya/utils/types_and_category.dart';

class DischargePatientListCard extends StatelessWidget {
  final dynamic patient;
  const DischargePatientListCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Circular Image on the left
            patient['photo'] != null
                ? Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(patient['photo']),
                      ),
                    ),
                  )
                : const Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Colors.grey,
                  ),
            const SizedBox(width: 16.0), // Add spacing between image and text
            // Other information on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient['pName'] as String,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Discharge Reason: '),
                      Expanded(
                        child: Text(
                          '${dischargeReasonByNo[patient['dischargeType']]}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Discharge date: ${patient['endTime'].split('T')[0]}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
