import 'package:flutter/material.dart';

class NavigationDataHolder extends InheritedWidget {
  final Function(Widget) onChange;

  const NavigationDataHolder({
    super.key,
    required this.onChange,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static NavigationDataHolder of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NavigationDataHolder>()!;
  }
}
