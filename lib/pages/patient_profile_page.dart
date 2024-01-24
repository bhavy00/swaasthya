import 'package:flutter/material.dart';

final List<String> symptoms = [
  'Headache',
  'Cold',
  'Sour Throat',
  'Body Pain',
  'Cold'
];

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // rest of the information abour the patient
        const Text('Information about Patient'),
        const SizedBox(height: 8),
        Card(
          elevation: 8.0, // Set the elevation to add a shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Set rounded borders
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                Text('Patient ID: P123456'),
                Text('Patient UHI: UHI7890'),
                SizedBox(height: 8.0),

                // Doctor and Department Section
                Text('Doctor: Dr. Smith'),
                Text('Department: Cardiology'),
                SizedBox(height: 8.0),

                // Referred By Section
                Text('Referred By: Dr. Johnson'),
                SizedBox(height: 8.0),

                // Device Status Section
                Text('Device Status: Active'),
                SizedBox(height: 8.0),

                // Personal Information Section
                Text('Personal Info: Male, 35 years old'),
                SizedBox(height: 8.0),

                // Contact Information Section
                Text('Contact Info: john.doe@example.com'),
                Text('Phone: +123 456 7890'),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // symptoms
        const Text('Symptoms'),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 500,
          color: Colors.blueAccent,
        )
        // vitals
      ],
    );
  }
}
