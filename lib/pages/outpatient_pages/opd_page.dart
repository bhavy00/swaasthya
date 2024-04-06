import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/pages/add_patient_form/add_patient_form.dart';
import 'package:swaasthya/pages/patient_profile_pages/patient_info_page.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/widgets/cards/patient_info_card.dart';

class OPDPage extends StatefulWidget {
  final User? userData;
  const OPDPage({super.key, required this.userData});

  @override
  State<OPDPage> createState() => _OPDPageState();
}

class _OPDPageState extends State<OPDPage> {
  List<dynamic> patientList = [];
  bool hasError = false;
  void _fetchPatientList() async {
    try {
      final data = await authFetch(
          'patient/${widget.userData?.hospitalID}/patients/recent/2?role=${widget.userData?.role}&userID=${widget.userData?.id}',
          widget.userData?.token);
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
        title: const Text('OPD'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return AddPatientForm(
                  patientStatus: 1,
                  userID: widget.userData?.id,
                  departmentID: widget.userData?.departmentID,
                  hospitalID: widget.userData?.hospitalID,
                  token: widget.userData?.token,
                );
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
                            isInPatient: false,
                            isOPD: true,
                            patient: patient,
                            token: widget.userData?.token,
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
