import 'package:flutter/material.dart';
import 'package:swaasthya/pages/inpatient_pages/discharge_patient_form.dart';
import 'package:swaasthya/pages/patient_profile_pages/medical_history_page.dart';
import 'package:swaasthya/pages/patient_profile_pages/patient_profile_page.dart';
import 'package:swaasthya/pages/outpatient_pages/prescription_page.dart';
import 'package:swaasthya/pages/patient_profile_pages/reports_page.dart';
import 'package:swaasthya/pages/inpatient_pages/transfer_patient_form.dart';
import 'package:swaasthya/pages/patient_profile_pages/test_page.dart';
import 'package:swaasthya/pages/patient_profile_pages/treatment_page.dart';
import 'package:swaasthya/utils/navigation_data_holder.dart';
import 'package:swaasthya/widgets/navigation_bar.dart';
import 'package:swaasthya/utils/pair.dart';

Pair<String, Widget> t1 = Pair('Basic Info', const PatientProfilePage());
Pair<String, Widget> t2 = Pair('Reports', const ReportsPage());
Pair<String, Widget> t3 = Pair('Medical History', const MedicalHistoryPage());
Pair<String, Widget> t4 = Pair('Treatment', const TreatmentPage());
Pair<String, Widget> t5 = Pair('Prescriptions', const PrescriptionPage());
Pair<String, Widget> t6 = Pair('Tests', const TestPage());

class PatientInfo extends StatefulWidget {
  final bool isInPatient;
  final bool isOPD;
  const PatientInfo(
      {super.key, required this.isInPatient, required this.isOPD});
  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  Widget selectedWidget = const PatientProfilePage();
  void onChange(Widget value) {
    setState(() {
      selectedWidget = value;
    });
  }

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
          elevation: 0,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: NavigationDataHolder(
              onChange: onChange,
              child: CustomTopNavigationBar(navItems: [
                t1,
                t2,
                t3,
                if (!widget.isOPD) ...[
                  t4,
                ],
                if (widget.isOPD) ...[
                  t5,
                ],
                t6,
              ]),
            ),
          )),
      body: selectedWidget,
    );
  }
}
