import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/add_vitals_dialog.dart';
import 'package:swaasthya/pages/vitals_info_page.dart';

class VitalsWidget extends StatelessWidget {
  const VitalsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Vitals'),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AddVitalsDialog();
                    });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) {
                  return const VitalsInfoPage();
                }),
              ),
            );
          },
          child: Card(
            elevation: 4,
            shadowColor: const Color.fromRGBO(
                0, 0, 0, 1), // Set the elevation to add a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Set rounded borders
            ),
            child: Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('72 bt/min'),
                          Text('Heart rate'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('95'),
                          Text('SpO2'),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('120 mmHg'),
                          Text('Blood Pressure'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('37'),
                          Text('Temprature'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
