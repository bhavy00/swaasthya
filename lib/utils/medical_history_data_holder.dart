import 'package:flutter/material.dart';
import 'package:swaasthya/utils/medical_history_class.dart';

class MedicalHistoryDataHolder extends InheritedWidget {
  final MedicalHistory history;

  const MedicalHistoryDataHolder({
    super.key,
    required this.history,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MedicalHistoryDataHolder of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MedicalHistoryDataHolder>()!;
  }
}
