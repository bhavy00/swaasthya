import 'package:flutter/material.dart';

List<String> wards = ['General', 'Private', 'ICU', 'NICU'];
List<String> category = ['Adult', 'Neonate', 'Children'];
List<String> device = ['Device', 'No-device'];

class SearchPatient extends StatefulWidget {
  const SearchPatient({super.key});

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            label: Text('Search'),
            prefixIcon: Icon(Icons.search),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter text to search";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        FilterChipClass(filters: wards),
        const SizedBox(
          height: 4,
        ),
        FilterChipClass(filters: category),
        const SizedBox(
          height: 4,
        ),
        FilterChipClass(filters: device),
        
      ],
    );
  }
}

class FilterChipClass extends StatefulWidget {
  final List<String> filters;
  const FilterChipClass({super.key, required this.filters});

  @override
  State<FilterChipClass> createState() => _FilterChipClassState();
}

class _FilterChipClassState extends State<FilterChipClass> {
  String selectedFilter = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: 5.0,
            alignment: WrapAlignment.start,
            children: widget.filters.map((filter) {
              return FilterChip(
                label: Text(filter),
                selected: selectedFilter == filter,
                onSelected: (bool selected) {
                  setState(() {
                    selectedFilter = selected ? filter : '';
                    // print(selectedFilter);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
