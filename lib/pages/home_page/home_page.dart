import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swaasthya/pages/home_page/notification_page.dart';
import 'package:swaasthya/pages/home_page/user_profile_page.dart';
import 'package:swaasthya/widgets/stats_view_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    bool tabView = MediaQuery.of(context).size.width >= 600;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Text('Swaasthya'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const NotificationPage();
                }),
              );
            },
            icon: const Badge(
              label: Text('5'),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return const UserProfilePage();
                  }),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      // leading: Icon(Icons.person),
                      title: Row(
                        children: [
                          Icon(Icons.notifications_active),
                          Text(' Upcoming'),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Intra Department Meeting'),
                          Text('3:00PM')
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Hi, User!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text('Today: '),
                  Text(formattedDate),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    SizedBox(
                      height: tabView
                          ? 200
                          : MediaQuery.of(context).size.height * 0.2,
                      width: tabView
                          ? 180
                          : MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        color: const Color(0xFFFFDF99),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'InPatients',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '45',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: tabView
                          ? 200
                          : MediaQuery.of(context).size.height * 0.2,
                      width: tabView
                          ? 180
                          : MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        color: const Color(0xFF77A8F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'OutPatients',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '50',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: tabView
                          ? 200
                          : MediaQuery.of(context).size.height * 0.2,
                      width: tabView
                          ? 180
                          : MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        color: const Color(0xFFA299EB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Emergency',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '15',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: tabView
                          ? 200
                          : MediaQuery.of(context).size.height * 0.2,
                      width: tabView
                          ? 180
                          : MediaQuery.of(context).size.width * 0.45,
                      child: Card(
                        color: const Color(0xFFF29494),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dischargeded',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '65',
                                style: Theme.of(context).textTheme.displayLarge,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // statistics
              const StatsViewPages(),
            ],
          ),
        ),
      ),
    );
  }
}
