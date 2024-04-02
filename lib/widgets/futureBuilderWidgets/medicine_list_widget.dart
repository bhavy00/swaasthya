import 'package:flutter/material.dart';
import 'package:swaasthya/utils/types_and_category.dart';
import 'package:swaasthya/widgets/cards/medicine_card.dart';

class MedicineListWidget extends StatefulWidget {
  final Future<List<dynamic>> Function() getAllMedicines;
  final String filter;
  const MedicineListWidget({
    super.key,
    required this.getAllMedicines,
    required this.filter,
  });

  @override
  State<MedicineListWidget> createState() => _MedicineListWidgetState();
}

class _MedicineListWidgetState extends State<MedicineListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.getAllMedicines(),
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          //print('error ${snapshot.error}');
          return const Text('An error occured');
        } else {
          List<dynamic>? data = snapshot.data;
          List<dynamic>? treat = widget.filter != 'All'
              ? data
                  ?.where((item) =>
                      item['medicineType'] == medicineCategory[widget.filter])
                  .toList()
              : data;
          return treat?.length == 0
              ? Text(
                  'No ${widget.filter != 'All' ? widget.filter : 'Medicines'} yet')
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    treat?.length ?? 0,
                    (index) {
                      final treatment = treat?[index];
                      return MedicineCard(
                        medicineName: treatment['medicineName'],
                        medicationTime: treatment['medicationTime'],
                        numberOfDoses: treatment['doseCount'],
                        duration: treatment['daysCount'],
                        notes: treatment['notes'],
                      );
                    },
                  ),
                );
        }
      },
    );
  }
}
