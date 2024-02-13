import 'package:flutter/material.dart';
import 'package:swaasthya/pages/add_patient_form/add_patient_form.dart';
import 'package:swaasthya/pages/patient_profile_pages/patient_info_page.dart';
import 'package:swaasthya/widgets/patient_info_card.dart';

class EmergencyPage extends StatefulWidget {
  final List<Map<String, dynamic>> patientList;
  const EmergencyPage({super.key, required this.patientList});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
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
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Search'),
                hintText: 'Search...',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Implement search functionality here
              },
            ),
          ),
        ),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: widget.patientList.length,
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemBuilder: (context, index) {
          final patient = widget.patientList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return const PatientInfo(
                  isInPatient: false,
                  isOPD: false,
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

// class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
//   const SearchAppBar({super.key});

//   @override
//   State<SearchAppBar> createState() => _SearchAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight + 60.0);
// }

// class _SearchAppBarState extends State<SearchAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(60.0),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             decoration: InputDecoration(
//                 label: const Text('Search'),
//                 hintText: 'Search...',
//                 border: const OutlineInputBorder(),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 prefixIcon: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       search = false;
//                     });
//                   },
//                   icon: const Icon(Icons.arrow_back_rounded),
//                 )),
//             onChanged: (value) {
//               // Implement search functionality here
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
