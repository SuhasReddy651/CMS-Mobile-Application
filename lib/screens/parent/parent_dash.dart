import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../common screens/fees_portal.dart';
import '../common screens/help_desk.dart';
import '../common screens/results_page.dart';
import 'package:flutter/material.dart';

import '../options_page.dart';
import '../student/student_attendance.dart';
import '../student/student_tt.dart';

class ParentDash extends StatefulWidget {
  const ParentDash({super.key});

  @override
  State<ParentDash> createState() => _ParentDashState();
}

class _ParentDashState extends State<ParentDash> {
  @override
  Widget build(BuildContext context) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final data = snapshot.data!.data();
        late String name = data!['name'];
        return Scaffold(
          body: Container(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 80,
                                    left: 20,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "$name's",
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                    left: 20,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Parent's Portal",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            PopupMenuButton<String>(
                              surfaceTintColor: Colors.grey,
                              onSelected: (value) {
                                if (value == 'signout') {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OptionsPage()),
                                    (Route<dynamic> route) => false,
                                  );
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'signout',
                                  child: Text('Sign out'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const StuAttenDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                    margin: const EdgeInsets.all(15),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 64, 108, 186),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    height: 251,
                                    width: 212,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 75.0,
                                          ),
                                          child: const Icon(
                                            Icons.checklist_rounded,
                                            color: Color.fromARGB(
                                                255, 197, 196, 196),
                                            size: 80,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                            ),
                                            color: Color.fromARGB(
                                                255, 38, 65, 112),
                                          ),
                                          child: const Text(
                                            "Attendance",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const FeesDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 89, 150, 2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  height: 251,
                                  width: 212,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 75.0,
                                        ),
                                        child: const Icon(
                                          Icons.payment_rounded,
                                          color: Color.fromARGB(
                                              255, 234, 232, 232),
                                          size: 80,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                          ),
                                          color:
                                              Color.fromARGB(255, 60, 102, 1),
                                        ),
                                        child: const Text(
                                          "Fee Portal",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TimeTabDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 92, 27, 19),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  height: 251,
                                  width: 212,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 75.0,
                                        ),
                                        child: const Icon(
                                          Icons.table_chart_outlined,
                                          color: Color.fromARGB(
                                              255, 197, 196, 196),
                                          size: 80,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                          ),
                                          color: Color.fromARGB(255, 41, 12, 8),
                                        ),
                                        child: const Text(
                                          "Time Table",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ResultsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 14, 54, 127),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  height: 251,
                                  width: 212,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 75.0,
                                        ),
                                        child: const Icon(
                                          Icons.library_books_rounded,
                                          color: Color.fromARGB(
                                              255, 197, 196, 196),
                                          size: 80,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                          ),
                                          color: Color.fromARGB(255, 0, 34, 98),
                                        ),
                                        child: const Text(
                                          "Results",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HelpDeskDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 169, 134, 9),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  height: 251,
                                  width: 444,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 75.0,
                                        ),
                                        child: const Icon(
                                          Icons.help_center_rounded,
                                          color: Color.fromARGB(
                                              255, 197, 196, 196),
                                          size: 80,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                          ),
                                          color:
                                              Color.fromARGB(255, 100, 79, 5),
                                        ),
                                        child: const Text(
                                          "Help Desk",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
