import 'package:flutter/material.dart';
import 'package:swaasthya/theme/pallete.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PatientVisitsChart extends StatelessWidget {
  const PatientVisitsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // legend: const Legend(isVisible: true),
      title: const ChartTitle(
        text: 'Patient Monthly Visit',
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: const NumericAxis(
        title: AxisTitle(
          text: 'No. of Patient',
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      series: <CartesianSeries>[
        BarSeries<PatientVisitData, String>(
          dataSource: getPatientVisitsData(),
          xValueMapper: (PatientVisitData data, _) => data.month,
          yValueMapper: (PatientVisitData data, _) => data.visits,
          // pointColorMapper: (PatientVisitData data, _) => chartPalette[_],
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  List<PatientVisitData> getPatientVisitsData() {
    return [
      PatientVisitData('Jan', 100),
      PatientVisitData('Feb', 120),
      PatientVisitData('Mar', 90),
      PatientVisitData('Apr', 150),
      PatientVisitData('May', 130),
      PatientVisitData('Jun', 110),
      PatientVisitData('Jul', 140),
      PatientVisitData('Aug', 160),
      PatientVisitData('Sep', 170),
      PatientVisitData('Oct', 200),
      PatientVisitData('Nov', 180),
      PatientVisitData('Dec', 190),
    ];
  }
}

class PatientVisitData {
  final String month;
  final int visits;

  PatientVisitData(this.month, this.visits);
}
