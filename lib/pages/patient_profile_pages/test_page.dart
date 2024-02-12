import 'package:flutter/material.dart';
import 'package:swaasthya/widgets/add_test_form.dart';

List<String> tests = [
  'test_1',
  'test_2',
  'test_3',
  'test_4',
  'test_5',
  'test_6',
  'test_7',
  'test_8',
  'test_9',
  'test_10',
  'test_11',
];

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: DataTable(
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
                    rows: List.generate(tests.length, (index) {
                      return DataRow(cells: [
                        DataCell(
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              tests[index],
                            ),
                          ),
                        ),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        ),
                      ]);
                    }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddTestForm();
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
        ],
      ),
    );
  }
}
