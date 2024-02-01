import 'package:flutter/material.dart';

class PatientProfileCard extends StatelessWidget {
  const PatientProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 200,
      child: PageView(
        children: const [
          CardOne(),
          CardTwo(),
          CardThree(),
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Patient Information',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://placekitten.com/80/80', // Replace with your image URL
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Patient\'s Name: Anna Cruise'),
                      Text('ID: 123456'),
                      Text('Doctor Name: Dr. John Doe'),
                      Text('Department: Cardiology'),
                      Text('Referred By: Dr. Jane Smith'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  const CardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health Information',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Height: 175 cm'),
            Text('Weight: 70 kg'),
            Text('UHID: 987654321'),
            Text('Gender: Male'),
            Text('DOB: January 1, 1990'),
          ],
        ),
      ),
    );
  }
}

class CardThree extends StatelessWidget {
  const CardThree({super.key});
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Email: patient@example.com'),
            Text('Phone Number: +1234567890'),
            Text('Address: 123 Main St.'),
            Text('State: California'),
            Text('City: Los Angeles'),
            Text('Pincode: 90001'),
          ],
        ),
      ),
    );
  }
}
