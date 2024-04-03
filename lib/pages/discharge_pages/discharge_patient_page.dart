import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/pages/patient_profile_pages/patient_info_page.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/widgets/cards/discharge_patient_list_card.dart';

class DischargePatientPage extends StatelessWidget {
  final User? userData;
  const DischargePatientPage({super.key, this.userData});

  Future<List<dynamic>> _fetchDishchargedPatients() async {
    final data = await authFetch(
        'patient/${userData?.hospitalID}/patients/21?role=${userData?.role}&userID=${userData?.id}',
        userData?.token);
    return data['patients'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discharged Patient'),
        centerTitle: true,
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
      body: FutureBuilder(
        future: _fetchDishchargedPatients(),
        builder: (builder, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            //print('error ${snapshot.error}');
            return const Text('An error occured');
          } else {
            List<dynamic>? patientList = snapshot.data;
            return patientList?.length == 0
                ? const Text('No patient found')
                : ListView.separated(
                    separatorBuilder: ((context, index) {
                      return const Divider();
                    }),
                    scrollDirection: Axis.vertical,
                    itemCount: patientList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final patient = patientList?[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: ((context) {
                            return PatientInfo(
                              isInPatient: false,
                              isOPD: false,
                              patient: patient,
                              token: userData?.token,
                            );
                          })));
                        },
                        child: DischargePatientListCard(
                          patient: patient,
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
