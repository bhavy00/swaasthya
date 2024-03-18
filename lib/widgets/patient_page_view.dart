import 'package:flutter/material.dart';

class PatientProfileCard extends StatefulWidget {
  final dynamic patient;
  const PatientProfileCard({super.key, required this.patient});

  @override
  State<PatientProfileCard> createState() => _PatientProfileCardState();
}

class _PatientProfileCardState extends State<PatientProfileCard> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  late List<Widget> _pages = [
    CardOne(
      patient: widget.patient,
    ),
    CardTwo(
      patient: widget.patient,
    ),
    CardThree(
      patient: widget.patient,
    ),
  ];
  // final double height = max(content, b);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 250,
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
  final dynamic patient;
  const CardOne({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width >= 600 ? 350 : 450),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: patient['photo'] == null
                                  ? const NetworkImage('url')
                                  : NetworkImage(patient['photo']),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Patient\'s Name: ${patient['firstName']} ${patient['lastName']}'),
                            Text('ID: ${patient['pID']}'),
                            Text('Doctor Name: Dr. ${patient['doctorName']}'),
                            Text('Department: ${patient['department']}'),
                            Text('Referred By: ${patient['referredBy'] ?? ''}'),
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
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  final dynamic patient;
  const CardTwo({super.key, required this.patient});

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
                'Health Information',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text('Height: ${patient['height']} cm'),
              Text('Weight: ${patient['weight']} kg'),
              Text('UHID: ${patient['pUHID']}'),
              Text('Gender: ${patient['gender'] == 1 ? 'male' : 'female'}'),
              Text('DOB: ${patient['dob'].split('T')[0]}'),
            ],
          ),
        ),
      ),
    );
  }
}

class CardThree extends StatelessWidget {
  final dynamic patient;
  const CardThree({super.key, required this.patient});
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
                'Contact Information',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text('Email: ${patient['email']}'),
              Text('Phone Number: ${patient['phoneNumber']}'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  'Address: ${patient['address']}',
                  // maxLines: 2,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('State: ${patient['state']}'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text('City: ${patient['city']}'),
              ),
              Text('Pincode: ${patient['pincode']}'),
            ],
          ),
        ),
      ),
    );
  }
}
