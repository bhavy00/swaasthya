import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swaasthya/apis/use_auth_patch.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';
import 'package:swaasthya/utils/types_and_category.dart';

class MedicineRemindersListWidget extends ConsumerStatefulWidget {
  final Future<List<dynamic>> Function() getAllMedicineReminders;
  final String? token;
  const MedicineRemindersListWidget({
    super.key,
    required this.getAllMedicineReminders,
    this.token,
  });

  @override
  ConsumerState<MedicineRemindersListWidget> createState() =>
      _MedicineRemindersListWidgetState();
}

class _MedicineRemindersListWidgetState
    extends ConsumerState<MedicineRemindersListWidget> {
  bool updated = false;
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            'Medicine Name: ${reminders?[index]['medicineName']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Type: ${medicineCategoryByNo[reminders?[index]['medicineType']]}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              if (reminders?[index]['doseStatus'] == 0) ...[
                                Text(
                                  'Dosage Time: ${reminders?[index]['dosageTime'] != null ? DateFormat('MMM d, hh:mm a').format(DateTime.parse(reminders?[index]['dosageTime'])) : 'No time found'}',
                                  style: const TextStyle(fontSize: 14),
                                )
                              ] else ...[
                                Text(
                                    'Given Time: ${reminders?[index]['givenTime'] != null ? DateFormat('MMM d, hh:mm a').format(DateTime.parse(reminders?[index]['givenTime'])) : 'No time found'}'),
                                Text(
                                    'Given By: ${reminders?[index]['firstName'] ?? ''} ${reminders?[index]['lastName'] ?? ''}')
                              ],
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: reminders?[index]['doseStatus'] == 1
                                ? null
                                : () async {
                                    try {
                                      await authPatch(
                                        'medicineReminder/${reminders?[index]['id']}',
                                        widget.token,
                                        {
                                          'userID': ref.read(userProvider)?.id,
                                          'doseStatus': 1,
                                        },
                                      );
                                      setState(() {
                                        updated = !updated;
                                      });
                                    } catch (e) {
                                      setState(() {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: const Text(
                                              'Failed to update reminder, please try again later'),
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ));
                                      });
                                    }
                                  },
                            icon: Icon(
                              Icons.check_circle,
                              color: reminders?[index]['doseStatus'] == 1
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ),
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
