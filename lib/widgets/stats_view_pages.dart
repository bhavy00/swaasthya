import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/widgets/charts/patient_department_chart.dart';
import 'package:swaasthya/widgets/charts/patient_month_chart.dart';
import 'package:swaasthya/widgets/charts/patient_ward_pie_chart.dart';

class StatsViewPages extends StatefulWidget {
  final User? user;
  const StatsViewPages({super.key, this.user});

  @override
  State<StatsViewPages> createState() => _StatsViewPagesState();
}

class _StatsViewPagesState extends State<StatsViewPages> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      PatientWardPieChart(),
      PatientVisitsChart(user: widget.user,),
      DepartmentPatientsChart()
    ];
    return Container(
      margin: const EdgeInsets.all(16),
      height: 500,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page % _pages.length;
                });
              },
              itemBuilder: ((context, index) {
                return _pages[index % _pages.length];
              }),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor:
                          _activePage == index ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
