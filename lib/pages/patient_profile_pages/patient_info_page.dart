import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
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

class PatientInfo extends StatefulWidget {
  final bool isInPatient;
  final bool isOPD;
  final dynamic patient;
  final String? token;
  const PatientInfo({
    super.key,
    required this.isInPatient,
    required this.isOPD,
    required this.patient,
    required this.token,
  });
  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  dynamic patient = 5;
  Widget selectedWidget = const Center(child: CircularProgressIndicator());
  bool error = false;
  void _getPatientData() async {
    try {
      final data = await authFetch(
        'patient/${widget.patient['hospitalID']}/patients/single/${widget.patient['id']}',
        widget.token,
      );
      setState(() {
        patient = data['patient'];
        selectedWidget = PatientProfilePage(
          patient: patient,
        );
      });
      //print(patient);
    } catch (e) {
      error = true;
      //print(e);
    }
  }

  void onChange(Widget value) {
    setState(() {
      selectedWidget = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPatientData();
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
          return DischargePatientForm(
            hospitalID: widget.patient['hospitalID'],
            token: widget.token,
            patientID: widget.patient['id'],
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Pair<String, Widget> t1 = Pair(
      'Basic Info',
      PatientProfilePage(
        patient: patient,
      ),
    );
    Pair<String, Widget> t2 = Pair(
        'Reports',
        ReportsPage(
          patient: patient,
          token: widget.token,
        ));
    Pair<String, Widget> t3 = Pair(
        'Medical History',
        MedicalHistoryPage(
          patient: patient,
          token: widget.token,
        ));
    Pair<String, Widget> t4 = Pair(
        'Treatment',
        TreatmentPage(
          patient: patient,
          token: widget.token,
        ));
    Pair<String, Widget> t5 = Pair('Prescriptions', const PrescriptionPage());
    Pair<String, Widget> t6 = Pair('Tests', const TestPage());
    return error
        ? const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          )
        : Scaffold(
            appBar: AppBar(
                elevation: 0,
                title: Text('${widget.patient['pName']}\'s information'),
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
