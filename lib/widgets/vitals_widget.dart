import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/widgets/forms/add_vitals_dialog.dart';
import 'package:swaasthya/pages/patient_profile_pages/vitals_info_page.dart';

class VitalsWidget extends StatefulWidget {
  final int? timelineID;
  final int? hospitalID;
  final String? token;
  final int? userID;
  const VitalsWidget({
    super.key,
    this.timelineID,
    this.hospitalID,
    this.token,
    this.userID,
  });

  @override
  State<VitalsWidget> createState() => _VitalsWidgetState();
}

class _VitalsWidgetState extends State<VitalsWidget> {
  Future<List> _fetchAllVitals() async {
    final data = await authFetch(
        'vitals/${widget.hospitalID}/${widget.timelineID}', widget.token);
    return data['vitals'];
  }

  @override
  Widget build(BuildContext context) {
    bool tabView = MediaQuery.of(context).size.width >= 600;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Vitals'),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddVitalsDialog(
                        userID: widget.userID,
                        timelineID: widget.timelineID,
                        token: widget.token,
                        hospitalID: widget.hospitalID,
                      );
                    });
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Center(
          child: FutureBuilder(
            future: _fetchAllVitals(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Some error occured');
              } else {
                List<Map<String, dynamic>> vitalList = [];
                List? vitals = snapshot.data;
                bool hasData = true;
                //print(vitals?[0]);
                if (vitals?.length != 0) {
                  vitalList = [
                    {
                      'color': Colors.lightGreen,
                      'title': 'Temprature',
                      'value': '${vitals?.last['temperature']} °C',
                      'time': '${vitals?.last['temperatureTime']}'
                    },
                    {
                      'color': Colors.pink,
                      'title': 'Heart Rate',
                      'value': '${vitals?.last['pulse']} bpm',
                      'time': '${vitals?.last['pulseTime']}'
                    },
                    {
                      'color': Colors.lightBlue,
                      'title': 'Oxygen',
                      'value': '${vitals?.last['oxygen']} %',
                      'time': '${vitals?.last['oxygenTime']}'
                    },
                    {
                      'color': Colors.purple[300],
                      'title': 'Blood Pressure',
                      'value': '${vitals?.last['bp']} mmHg',
                      'time': '${vitals?.last['bpTime']}'
                    },
                  ];
                } else {
                  hasData = false;
                }
                return !hasData
                    ? const Text('No vitals added')
                    : GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) {
                                return VitalsInfoPage(
                                  vitals: vitals,
                                );
                              }),
                            ),
                          );
                        },
                        child: Center(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: vitalList.map((item) {
                              return SizedBox(
                                height: tabView
                                    ? 200
                                    : MediaQuery.of(context).size.height * 0.25,
                                width: tabView
                                    ? 180
                                    : MediaQuery.of(context).size.width * 0.45,
                                child: Card(
                                  color: item['color'],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item['title'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            const Icon(Icons.arrow_forward)
                                          ],
                                        ),
                                        Text(
                                          item['value'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                        Text(
                                            'Date added: ${item['time'].split('T')[0]}'),
                                        //Text('Time added: ${item['time'].split('T')[1]}'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
              }
            },
          ),
        ),
      ],
    );
  }
}
