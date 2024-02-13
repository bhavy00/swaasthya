import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PatientWardPieChart extends StatelessWidget {
  const PatientWardPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: const ChartTitle(text: 'Patients\' Ward Statistics'),
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.right,
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
