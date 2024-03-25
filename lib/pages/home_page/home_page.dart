import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swaasthya/apis/use_auth_fetch.dart';
import 'package:swaasthya/pages/home_page/notification_page.dart';
import 'package:swaasthya/pages/home_page/user_profile_page.dart';
import 'package:swaasthya/pages/hubs_page.dart';
import 'package:swaasthya/pages/inpatient_pages/discharge_patient_page.dart';
import 'package:swaasthya/pages/login_page.dart';
import 'package:swaasthya/utils/classes/user_data_class.dart';
import 'package:swaasthya/utils/patient_list.dart';
import 'package:swaasthya/utils/providers/logged_in_provider.dart';
import 'package:swaasthya/utils/providers/user_provider.dart';
import 'package:swaasthya/widgets/stats_view_pages.dart';

class HomePage extends ConsumerStatefulWidget {
  final User? user;
  const HomePage({super.key, required this.user});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool err = false;
  Future<List<int>> _fetchPatientCnt() async {
    final data1 = await authFetch(
        'patient/${widget.user?.hospitalID}/patients/count/2',
        widget.user?.token);
    final data2 = await authFetch(
        'patient/${widget.user?.hospitalID}/patients/count/1',
        widget.user?.token);
    final data3 = await authFetch(
        'patient/${widget.user?.hospitalID}/patients/count/3',
        widget.user?.token);
    final data4 = await authFetch(
        'patient/${widget.user?.hospitalID}/patients/count/21',
        widget.user?.token);
    return [data1['count'], data2['count'], data3['count'], data4['count']];
  }

  //outpatientCnt = 0, emergencyCnt = 0, dischargedCnt = 0;
  @override
  Widget build(BuildContext context) {
    bool tabView = MediaQuery.of(context).size.width >= 600;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swaasthya'),
        centerTitle: false,
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
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return UserProfilePage(
                      userData: widget.user,
                    );
                  }),
                ),
              );
            },
            icon: widget.user?.imageURL != null
                ? ImageIcon(
                    NetworkImage(widget.user?.imageURL as String),
                    size: 12,
                  )
                : const Icon(
                    Icons.person,
                  ),
          ),
          PopupMenuButton<String>(
            itemBuilder: ((context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Discharged',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DischargePatientPage(patientList: outPatientList);
                    }));
                  },
                  child: const Text('Discharged Patient'),
                ),
                PopupMenuItem<String>(
                  value: 'billing',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DischargePatientPage(patientList: outPatientList);
                    }));
                  },
                  child: const Text('Billing'),
                ),
                PopupMenuItem<String>(
                  value: 'hubs',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const HubsPage();
                    }));
                  },
                  child: const Text('Hubs'),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  onTap: () {
                    ref.read(userProvider.notifier).updateUser(const User());
                    ref.read(loggedInProvider.notifier).logIn(false);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                  child: const Text('Logout'),
                ),
              ];
            }),
          ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${widget.user?.firstName}',
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
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: FutureBuilder<List<int>>(
                    future: _fetchPatientCnt(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text('error occured');
                      } else {
                        return Wrap(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'InPatients',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        '${snapshot.data?[0]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'OutPatients',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        '${snapshot.data?[1]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Emergency',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        '${snapshot.data?[2]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dischargeded',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        '${snapshot.data?[3]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              // statistics
              StatsViewPages(user: widget.user),
            ],
          ),
        ),
      ),
    );
  }
}
