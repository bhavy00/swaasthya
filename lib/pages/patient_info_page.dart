import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/navigation_bar.dart';
import 'package:swaasthya/utils/pair.dart';

Pair<String, Widget> t1 = Pair('tab1', const Tab1Content());
Pair<String, Widget> t2 = Pair('tab2', const Tab2Content());
Pair<String, Widget> t3 = Pair('tab3', const Tab3Content());

List<Pair<String, Widget>> V = [t1, t2, t3, t3, t3, t3];

class PatientInfo extends StatefulWidget {
  const PatientInfo({super.key});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomTopNavigationBar(
            navItems: V,
          ),
          //Tab1Content(),
        ],
      ),
    );
  }
}

class Tab1Content extends StatelessWidget {
  const Tab1Content({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Content for Tab 1'));
  }
}

class Tab2Content extends StatelessWidget {
  const Tab2Content({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Content for Tab 2'));
  }
}

class Tab3Content extends StatelessWidget {
  const Tab3Content({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Content for Tab 3'));
  }
}
