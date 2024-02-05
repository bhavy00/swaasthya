import 'package:flutter/material.dart';
import 'package:swaasthya/pages/discharge_patient_form.dart';
import 'package:swaasthya/pages/medical_history_page.dart';
import 'package:swaasthya/pages/patient_profile_page.dart';
import 'package:swaasthya/pages/prescription_page.dart';
import 'package:swaasthya/pages/reports_page.dart';
import 'package:swaasthya/pages/transfer_patient_form.dart';
import 'package:swaasthya/pages/treatment_page.dart';
import 'package:swaasthya/widgets/navigation_bar.dart';
import 'package:swaasthya/utils/pair.dart';

Pair<String, Widget> t1 = Pair('Basic Info', const PatientProfilePage());
Pair<String, Widget> t2 = Pair('Reports', const ReportsPage());
Pair<String, Widget> t3 = Pair('Medical History', const MedicalHistoryPage());
Pair<String, Widget> t4 = Pair('Treatment', const TreatmentPage());
Pair<String, Widget> t5 = Pair('Prescriptions', const PrescriptionPage());

class PatientInfo extends StatefulWidget {
  final bool isInPatient;
  final bool isOPD;
  const PatientInfo(
      {super.key, required this.isInPatient, required this.isOPD});
  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  void _handleOptionSelected(String value) {
    if (value == 'transfer') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return const TransferPatientForm();
        }),
      );
    } else if (value == 'discharge') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return const DischargePatientForm();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient\'s information'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: _handleOptionSelected,
            itemBuilder: ((context) {
              return <PopupMenuEntry<String>>[
                if (widget.isInPatient) ...[
                  const PopupMenuItem<String>(
                    value: 'discharge',
                    child: Text('Discharge Patient'),
                  ),
                ],
                const PopupMenuItem<String>(
                  value: 'transfer',
                  child: Text('Transfer Patient'),
                )
              ];
            }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTopNavigationBar(navItems: [
                t1,
                t2,
                t3,
                if (!widget.isOPD) ...[
                  t4,
                ],
                if (widget.isOPD) ...[
                  t5,
                ],
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
