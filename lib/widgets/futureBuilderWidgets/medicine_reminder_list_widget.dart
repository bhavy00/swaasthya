import 'package:flutter/material.dart';
import 'package:swaasthya/pages/patient_profile_pages/treatment_page.dart';

class MedicineRemindersListWidget extends StatefulWidget {
  final Future<List<dynamic>> Function() getAllMedicineReminders;
  const MedicineRemindersListWidget(
      {super.key, required this.getAllMedicineReminders});

  @override
  State<MedicineRemindersListWidget> createState() =>
      _MedicineRemindersListWidgetState();
}

class _MedicineRemindersListWidgetState
    extends State<MedicineRemindersListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.getAllMedicineReminders(),
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          //print('error ${snapshot.error}');
          return const Text('An error occured');
        } else {
          List<dynamic>? reminders = snapshot.data;
          return reminders?.length == 0
              ? const Text('No reminders yet')
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(reminders?.length ?? 0, (index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Medicine Name: ${reminders?[index]['medicineName']}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Type: ${medicineCategory[reminders?[index]['medicineType']]}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '',
                              style: const TextStyle(fontSize: 14),
                            ),
                            
                          ],
                        ),
                      ),
                    );
                  }),
                );
        }
      },
    );
  }
}
