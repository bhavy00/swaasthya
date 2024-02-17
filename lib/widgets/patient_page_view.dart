import 'dart:math';

import 'package:flutter/material.dart';

class PatientProfileCard extends StatefulWidget {
  const PatientProfileCard({super.key});

  @override
  State<PatientProfileCard> createState() => _PatientProfileCardState();
}

class _PatientProfileCardState extends State<PatientProfileCard> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  final List<Widget> _pages = const [CardOne(), CardTwo(), CardThree()];
  // final double height = max(content, b);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 220,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page % _pages.length;
                });
              },
              itemBuilder: ((context, index) {
                return _pages[index % _pages.length];
              }),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor:
                          _activePage == index ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width >= 600 ? 350 : 450),
      child: Card(
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  const CardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width >= 600 ? 350 : 450),
      child: const Card(
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
      ),
    );
  }
}

class CardThree extends StatelessWidget {
  const CardThree({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width >= 600 ? 350 : 450),
      child: const Card(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  'Address: 123 Main St. ueirvnurefnori fri foirf irojf rwjfr jfqj fpw',
                  // maxLines: 2,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('State: California'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('City: Los Angeles'),
              ),
              Text('Pincode: 90001'),
            ],
          ),
        ),
      ),
    );
  }
}
