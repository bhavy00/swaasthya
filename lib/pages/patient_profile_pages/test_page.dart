import 'package:flutter/material.dart';
import 'package:swaasthya/apis/use_auth_delete.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/widgets/forms/add_test_form.dart';

class TestPage extends StatefulWidget {
  final String? token;
  final dynamic patient;
  const TestPage({super.key, this.token, this.patient});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool added = false;
  void updateList() {
    setState(() {
      added = true;
    });
  }

  Future<List<dynamic>> _getAllTests() async {
    final data = await authFetch(
        'test/${widget.patient['patientTimeLineID']}', widget.token);
    return data['tests'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
                future: _getAllTests(),
                builder: (builder, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    //print('error ${snapshot.error}');
                    return const Text('An error occured');
                  } else {
                    //print(snapshot.data);
                    List<dynamic>? tests = snapshot.data;
                    return tests?.length == 0
                        ? const Text('No test added')
                        : DataTable(
                            columns: const [
                              DataColumn(
                                  label: Expanded(
                                child: Text(
                                  'Test Name',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                              DataColumn(label: Text('Delete')),
                            ],
                            rows: List.generate(tests?.length ?? 0, (index) {
                              return DataRow(cells: [
                                DataCell(
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      tests?[index]['test'],
                                    ),
                                  ),
                                ),
                                DataCell(
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      try {
                                        await authDelete(
                                            'test/${widget.patient['patientTimeLineID']}/${tests?[index]['id']}',
                                            widget.token);
                                        setState(() {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Successfully deleted ${tests?[index]['test']}'),
                                              backgroundColor:
                                                  Colors.lightGreen,
                                            ),
                                          );
                                        });
                                      } catch (e) {
                                        setState(() {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                  'Unable to delete test, please try again later'),
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .error,
                                            ),
                                          );
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ]);
                            }),
                          );
                  }
                }),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AddTestForm(
                            patient: widget.patient,
                            token: widget.token,
                            updatedList: updateList,
                          );
                        });
                  },
                  label: const Text('Add Test'),
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
