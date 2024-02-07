import 'package:flutter/material.dart';

class NavigationDataHolder extends InheritedWidget {
  Function(Widget) onChange;

  NavigationDataHolder({
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
