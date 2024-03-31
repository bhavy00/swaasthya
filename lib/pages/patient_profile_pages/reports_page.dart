import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/utils/types_and_category.dart';
import 'package:swaasthya/widgets/forms/add_report_form.dart';

List<String> types = ['Pathology', 'Radiology', 'Previous History'];

class ReportsPage extends StatefulWidget {
  final dynamic patient;
  final String? token;
  const ReportsPage({super.key, this.patient, this.token});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _reportType = 'Pathology';

  void _changeReportType(String? value) {
    setState(() {
      _reportType = value!;
    });
  }

  Future<List<dynamic>> _getAllReports() async {
    final data = await authFetch(
        'attachment/${widget.patient['hospitalID']}/all/${widget.patient['patientTimeLineID']}',
        widget.token);
    return data['attachments'];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Type of Report: '),
                  DropdownButton(
                    value: _reportType,
                    onChanged: _changeReportType,
                    items: types.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: _getAllReports(),
              builder: (builder, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  //print('error ${snapshot.error}');
                  return const Text('An error occured');
                } else {
                  List<dynamic>? data = snapshot.data;
                  List<dynamic>? reports = data
                      ?.where((element) =>
                          int.parse(element['category']) ==
                          reportType[_reportType])
                      .toList();
                  //print(reportType[_reportType]);
                  return reports?.length == 0
                      ? const Text('No reports yet')
                      : DataTable(
                          columnSpacing:
                              MediaQuery.of(context).size.width * 0.15,
                          columns: const [
                            DataColumn(
                              label: Text(
                                'Report Name',
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Text(
                                'Download Report',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ),
                            DataColumn(label: Text('Delete')),
                          ],
                          rows: reports?.map((item) {
                                return DataRow(cells: [
                                  DataCell(
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        item['fileName'],
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    IconButton(
                                      icon: const Icon(Icons.download),
                                      onPressed: () {},
                                    ),
                                  ),
                                  DataCell(
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          //reports.removeAt(index);
                                        });
                                      },
                                    ),
                                  ),
                                ]);
                              }).toList() ??
                              [],
                        );
                }
              },
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Upload report'),
                                content: AddReportForm(
                                  patient: widget.patient,
                                  token: widget.token,
                                ),
                              );
                            });
                      },
                      label: const Text('Add Report'),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
