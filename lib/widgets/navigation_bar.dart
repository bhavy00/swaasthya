import 'package:flutter/material.dart';
import 'package:swaasthya/utils/navigation_data_holder.dart';
import 'package:swaasthya/utils/pair.dart';

class CustomTopNavigationBar extends StatefulWidget {
  final List<Pair<String, Widget>> navItems;
  const CustomTopNavigationBar({super.key, required this.navItems});

  @override
  State<CustomTopNavigationBar> createState() => _CustomTopNavigationBarState();
}

class _CustomTopNavigationBarState extends State<CustomTopNavigationBar> {
  late String selectedNavItem;

  @override
  void initState() {
    super.initState();
    selectedNavItem = widget.navItems[0].key;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // margin: const EdgeInsets.only(top: 40),
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.navItems.length,
            itemBuilder: ((context, index) {
              final key = widget.navItems[index].key;
              final value = widget.navItems[index].value;
              final color = selectedNavItem == key
                  ? const Color(0xFF1D1E2C)
                  : const Color(0xFFF7EBEC);
              return Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedNavItem = key;
                      NavigationDataHolder.of(context).onChange(value);
                    });
                  },
                  child: Chip(
                    backgroundColor: color,
                    label: Text(
                      key,
                    ),
                    labelStyle: TextStyle(
                      color: selectedNavItem == key
                          ? const Color(0xFFF7EBEC)
                          : const Color(0xFF1D1E2C),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    elevation: 8,
                    shadowColor: const Color.fromRGBO(0, 0, 0, 1),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
