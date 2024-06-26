import 'package:flutter/material.dart';
import 'package:swaasthya/theme/pallete.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DepartmentPatientsChart extends StatelessWidget {
  const DepartmentPatientsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: const ChartTitle(
        text: 'Patients\' Department',
        textStyle: TextStyle(
          // color: Colors.white,
          fontSize: 24,
        ),
      ),
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.right,
        // textStyle: TextStyle(color: Colors.white),
      ),
      series: <CircularSeries>[
        // Renders a doughnut chart
        DoughnutSeries<DepartmentData, String>(
          dataSource: getDepartmentData(),
          xValueMapper: (DepartmentData data, _) => data.department,
          yValueMapper: (DepartmentData data, _) => data.patients,
          pointColorMapper: (DepartmentData data, _) => chartPalette[_],
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  List<DepartmentData> getDepartmentData() {
    return [
      DepartmentData('Cardiology', 120),
      DepartmentData('Neurology', 90),
      DepartmentData('Orthopedics', 150),
      DepartmentData('Oncology', 110),
      DepartmentData('Pediatrics', 140),
    ];
  }
}

class DepartmentData {
  final String department;
  final int patients;

  DepartmentData(this.department, this.patients);
}
