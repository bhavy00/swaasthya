import 'package:flutter/material.dart';
import 'package:swaasthya/pages/medical_history_page.dart';
import 'package:swaasthya/pages/patient_profile_page.dart';
import 'package:swaasthya/pages/reports_page.dart';
import 'package:swaasthya/pages/treatment_page.dart';
import 'package:swaasthya/widgets/navigation_bar.dart';
import 'package:swaasthya/utils/pair.dart';

Pair<String, Widget> t1 = Pair('Basic Info', const PatientProfilePage());
Pair<String, Widget> t2 = Pair('Reports', const ReportsPage());
Pair<String, Widget> t3 = Pair('Medical History', const MedicalHistoryPage());
Pair<String, Widget> t4 = Pair('Treatment', const TreatmentPage());

List<Pair<String, Widget>> navItems = [t1, t2, t3, t4];

class PatientInfo extends StatefulWidget {
  const PatientInfo({super.key});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1876F3),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              floating: false,
              pinned: false,
              backgroundColor: Color(0xFF1876F3),
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Patient Information'),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                              'https://placekitten.com/100/100', // Replace with your image URL
                            ),
                          ),
                          // Name Section
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Patient ID: P123456'),
                              SizedBox(height: 8.0),
                              Text('Doctor: Dr. Smith'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    CustomTopNavigationBar(navItems: navItems),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
