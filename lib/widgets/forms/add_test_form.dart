import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/apis/use_auth_post.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';

class AddTestForm extends ConsumerStatefulWidget {
  final String? token;
  final dynamic patient;
  final VoidCallback updatedList;
  const AddTestForm({
    super.key,
    this.token,
    this.patient,
    required this.updatedList,
  });

  @override
  ConsumerState<AddTestForm> createState() => _AddTestFormState();
}

class _AddTestFormState extends ConsumerState<AddTestForm> {
  List<Map<String, dynamic>> testList = [];
  List<String> allTestNames = [];
  String test = '';
  bool err = false, load2 = true, load = false;

  Future<void> _getAllTestsName() async {
    final data = await authFetch('data/getAllTests', widget.token);
    setState(() {
      allTestNames =
          List<String>.from(data['data'].map((item) => item['name']));
      test = allTestNames.first;
      load2 = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllTestsName();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Test'),
      content: load2
          ? const Center(child: CircularProgressIndicator())
          : err
              ? const Text('An error ocurred')
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      items: allTestNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                value,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          test = value!;
                        });
                      },
                      decoration: const InputDecoration(
                        label: Text('Test'),
                        border: OutlineInputBorder(),
                      ),
                      value: test,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          testList.add({'test': test});
                        });
                        //print(allTestNames);
                      },
                      label: const Text('Add'),
                      icon: const Icon(Icons.add),
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 5,
                      children: List<Widget>.generate(testList.length, (index) {
                        return InputChip(
                          label: Text(testList[index]['test'] ?? ''),
                          onDeleted: () {
                            setState(() {
                              testList.removeAt(index);
                            });
                          },
                        );
                      }),
                    )
                  ],
                ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            try {
              setState(() {
                load = true;
              });
              await authPost(
                'test',
                widget.token,
                {
                  'timeLineID': widget.patient['patientTimeLineID'],
                  'userID': ref.read(userProvider)?.id,
                  'tests': testList
                },
              );
              widget.updatedList();
              Navigator.of(context).pop();
            } catch (e) {
              setState(() {
                err = true;
                load = false;
              });
              print(e);
            }
          },
          child: load ? const CircularProgressIndicator() : const Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
