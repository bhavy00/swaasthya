import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_patient_form/add_patient_form.dart';
import 'package:swaasthya/pages/patient_profile_pages/patient_info_page.dart';
import 'package:swaasthya/widgets/patient_info_card.dart';

class OPDPage extends StatelessWidget {
  final List<Map<String, dynamic>> patientList;
  const OPDPage({super.key, required this.patientList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OPD'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddPatientForm();
              }));
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text('Search'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: patientList.length,
        itemBuilder: (context, index) {
          final patient = patientList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return const PatientInfo(
                  isInPatient: false,
                  isOPD: true,
                );
              })));
            },
            child: PatientInfoCard(
              patient: patient,
            ),
          );
        },
      ),
    );
  }
}
