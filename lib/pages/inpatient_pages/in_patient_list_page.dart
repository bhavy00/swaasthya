import 'package:flutter/material.dart';
import 'package:swaasthya/apis/patient_api.dart';
import 'package:swaasthya/pages/add_patient_form/add_patient_form.dart';
import 'package:swaasthya/pages/patient_profile_pages/patient_info_page.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/widgets/cards/patient_info_card.dart';

class InPatientListPage extends StatefulWidget {
  final User? userData;
  const InPatientListPage({super.key, this.userData});

  @override
  State<InPatientListPage> createState() => _InPatientListPageState();
}

class _InPatientListPageState extends State<InPatientListPage> {
  List<dynamic> patientList = [];
  bool hasError = false;
  void _fetchPatientList() async {
    try {
      final data = await Patient(
              hospitalID: widget.userData?.hospitalID,
              patientStatus:
                  2, // in backend patientStatus has type of int (i don't know why but they thought it was a good idea, instead of sending string)
              role: widget.userData?.role,
              userID: widget.userData?.id,
              token: widget.userData?.token)
          .getPatient();
      patientList = data['patients'];
    } catch (e) {
      setState(() {
        hasError = true;
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPatientList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InPatient'),
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
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search',
              onSubmitted: (value) {},
            ),
          ),
        ),
      ),
      body: hasError
          ? const Center(
              child: Text('An Error Occured!'),
            )
          : patientList.isEmpty
              ? const Center(
                  child: Text('No Patient Found'),
                )
              : ListView.separated(
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: patientList.length,
                  itemBuilder: (context, index) {
                    final patient = patientList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: ((context) {
                          return PatientInfo(
                            isInPatient: true,
                            isOPD: false,
                            patient: patient,
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
