import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/apis/use_auth_delete.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';
import 'package:swaasthya/widgets/forms/add_symptom_dialog.dart';

class SymptomsWidget extends ConsumerStatefulWidget {
  final int? timelineID;
  final String? token;
  const SymptomsWidget(
      {super.key, required this.timelineID, required this.token});

  @override
  ConsumerState<SymptomsWidget> createState() => _SymptomsWidgetState();
}

class _SymptomsWidgetState extends ConsumerState<SymptomsWidget> {
  List<dynamic> symptoms = [];
  bool error = false, loading = true, updated = false;

  void _refreshPage() {
    _fetchSymptomList();
  }

  void _fetchSymptomList() async {
    try {
      final data =
          await authFetch('symptom/${widget.timelineID}', widget.token);
      //print('$data, $widget.timelineID');
      setState(() {
        symptoms = data['symptoms'];
        loading = false;
      });
      //print(symptoms);
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
      //print(e);
    }
  }

  void _deleteSymptom(int id) async {
    try {
      loading = true;
      await authDelete('symptom/${widget.timelineID}/$id', widget.token);
      _fetchSymptomList();
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchSymptomList();
  }

  @override
  Widget build(BuildContext context) {
    //print(symptoms);
    final userID = ref.read(userProvider)?.id;
    return Column(
      children: [
        // symptoms
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Symptoms'),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddSymptomDialog(
                        userID: userID,
                        timelineID: widget.timelineID,
                        token: widget.token,
                        onDialogClosed: _refreshPage,
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
        loading
            ? const CircularProgressIndicator()
            : error
                ? const Text('Error occured')
                : symptoms.isEmpty
                    ? const Text('No symptoms added')
                    : Center(
                        child: DataTable(
                          columnSpacing:
                              MediaQuery.of(context).size.width * 0.2,
                          columns: const [
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'Symptom Name',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              'Duration',
                              maxLines: 2,
                            )),
                            DataColumn(
                                label: Text(
                              'Action',
                              maxLines: 2,
                            )),
                          ],
                          rows: List.generate(symptoms.length, (index) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(symptoms[index]['symptom']),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                      '${symptoms[index]['duration']} ${symptoms[index]['durationParameter']}'),
                                ),
                                DataCell(
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteSymptom(symptoms[index]['id']);
                                    },
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
      ],
    );
  }
}
