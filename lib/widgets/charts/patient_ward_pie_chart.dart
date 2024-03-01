import 'package:flutter/material.dart';
import 'package:swaasthya/theme/pallete.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PatientWardPieChart extends StatelessWidget {
  const PatientWardPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: const ChartTitle(
        text: 'Patients\' Ward Statistics',
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
        // Renders a pie chart
        PieSeries<PieChartData, String>(
          dataSource: <PieChartData>[
            PieChartData('General Ward', 50),
            PieChartData('Private Ward', 35),
            PieChartData('ICU', 10),
            PieChartData('NICU', 5),
          ],
          xValueMapper: (PieChartData data, _) => data.category,
          yValueMapper: (PieChartData data, _) => data.value,
          pointColorMapper: (PieChartData data, _) => chartPalette[_],
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        )
      ],
      margin: const EdgeInsets.all(0),
    );
  }
}

class PieChartData {
  final String category;
  final double value;

  PieChartData(this.category, this.value);
}
