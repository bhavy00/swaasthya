import 'package:flutter/material.dart';
import 'package:swaasthya/utils/pair.dart';

class CustomTopNavigationBar extends StatefulWidget {
  final List<Pair<String, Widget>> navItems;
  const CustomTopNavigationBar({super.key, required this.navItems});

  @override
  State<CustomTopNavigationBar> createState() => _CustomTopNavigationBarState();
}

class _CustomTopNavigationBarState extends State<CustomTopNavigationBar> {
  late String selectedNavItem;
  late Widget selectedNavWidget;

  @override
  void initState() {
    super.initState();
    selectedNavItem = widget.navItems[0].key;
    selectedNavWidget = widget.navItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.navItems.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedNavItem = widget.navItems[index].key;
                      selectedNavWidget = widget.navItems[index].value;
                      //print(selectedNavItem);
                    });
                  },
                  child: Chip(
                    backgroundColor:
                        selectedNavItem == widget.navItems[index].key
                            ? Colors.amber
                            : Colors.white,
                    label: Text(
                      widget.navItems[index].key,
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        selectedNavWidget,
      ],
    );
  }
}
