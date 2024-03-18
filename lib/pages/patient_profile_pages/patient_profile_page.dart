import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';
import 'package:swaasthya/widgets/symptoms_widget.dart';
import 'package:swaasthya/widgets/patient_page_view.dart';
import 'package:swaasthya/widgets/vitals_widget.dart';

class PatientProfilePage extends StatefulWidget {
  final dynamic patient;
  const PatientProfilePage({super.key, required this.patient});

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    //print(widget.patient);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaQuery.of(context).size.width < 600
                ? PatientProfileCard(
                    patient: widget.patient,
                  )
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      CardOne(
                        patient: widget.patient,
                      ),
                      CardTwo(
                        patient: widget.patient,
                      ),
                      CardThree(
                        patient: widget.patient,
                      ),
                    ],
                  ),
            const SizedBox(
              height: 10,
            ),
            Consumer(builder: ((context, ref, child) {
              final String? token = ref.read(userProvider)?.token;
              return Column(
                children: [
                  SymptomsWidget(
                    timelineID: widget.patient['patientTimeLineID'],
                    token: token,
                  ),
                  // vitals
                  const SizedBox(
                    height: 10,
                  ),
                  const VitalsWidget(),
                ],
              );
            }))
          ],
        ),
      ),
    );
  }
}
