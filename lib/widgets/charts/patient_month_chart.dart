import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/theme/pallete.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PatientVisitsChart extends StatelessWidget {
  final User? user;
  const PatientVisitsChart({super.key, this.user});

  Future<List> _getPatientCountMonthly() async {
    final data = await authFetch(
        'patient/${user?.hospitalID}/patients/count/fullYear/2', user?.token);
    return data['counts'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPatientCountMonthly(),
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          //print('error ${snapshot.error}');
          return const Text('An error occured');
        } else {
          List<PatientVisitData> getPatientVisitsData() {
            return snapshot.data
                    ?.map((item) =>
                        PatientVisitData(item['month'], item['count']))
                    .toList() ??
                [];
          }

          return SfCartesianChart(
            // legend: const Legend(isVisible: true),
            title: const ChartTitle(
              text: 'Patient Monthly Visit',
              textStyle: TextStyle(
                // color: Colors.white,
                fontSize: 24,
              ),
            ),
            primaryXAxis: const CategoryAxis(),
            primaryYAxis: const NumericAxis(
              title: AxisTitle(
                text: 'No. of Patient',
                textStyle: TextStyle(
                    // color: Colors.white,
                    ),
              ),
            ),
            series: <CartesianSeries>[
              BarSeries<PatientVisitData, String>(
                dataSource: getPatientVisitsData(),
                xValueMapper: (PatientVisitData data, _) => data.month,
                yValueMapper: (PatientVisitData data, _) => data.visits,
                color: chartPalette[0],
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          );
        }
      },
    );
  }
}

class PatientVisitData {
  final String month;
  final int visits;

  PatientVisitData(this.month, this.visits);
}
