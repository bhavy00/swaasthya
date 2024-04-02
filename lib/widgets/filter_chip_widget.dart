import 'package:flutter/material.dart';

class FilterChipClass extends StatefulWidget {
  final List<String> filters;
  final Function(String) filterChange;
  const FilterChipClass(
      {super.key, required this.filters, required this.filterChange});

  @override
  State<FilterChipClass> createState() => _FilterChipClassState();
}

class _FilterChipClassState extends State<FilterChipClass> {
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            alignment: WrapAlignment.start,
            children: widget.filters.map((filter) {
              return FilterChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                label: Text(filter),
                selected: selectedFilter == filter,
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = selected ? filter : '';
                    // print(selectedFilter);
                  });
                  if (selected) {
                    widget.filterChange(filter);
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
