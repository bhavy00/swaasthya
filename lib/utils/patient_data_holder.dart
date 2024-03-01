import 'package:flutter/material.dart';
import 'package:swaasthya/utils/classes/patient_class.dart';

class PatientDataHolder extends InheritedWidget {
  final Patient patient;

  const PatientDataHolder({
    super.key,
    required this.patient,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static PatientDataHolder of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PatientDataHolder>()!;
  }
}
