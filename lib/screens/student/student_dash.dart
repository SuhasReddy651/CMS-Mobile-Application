import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common screens/higher_studies_portal.dart';
import '../common screens/fees_portal.dart';
import '../common screens/help_desk.dart';
import '../common screens/helpful_tools.dart';
import '../common screens/library_portal.dart';
import '../common screens/others_portal.dart';
import '../common screens/results_page.dart';
import 'student_attendance.dart';
import 'student_lms.dart';
import 'student_tt.dart';

class StudentDash extends StatefulWidget {
  const StudentDash({super.key});

  @override
  State<StudentDash> createState() => _StudentDashState();
}

class _StudentDashState extends State<StudentDash> {
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
          final data = snapshot.data?.data();
          late final photo = data!['photo'];
          late final name = data!['name'];
          // ignore: avoid_unnecessary_containers
          return Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
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
                                    name + '\'s',
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
                                    "Dashboard",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(
                                top: 60,
                                right: 20,
                              ),
                              width: 65,
                              height: 65,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  photo,
                                ),
                                radius: 60,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                                              Color.fromARGB(255, 60, 102, 1),
                                        ),
                                        child: const Text(
                                          "Fees",
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
                                      builder: (context) => const LMSDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 129, 60, 4),
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
                                          Icons.book_rounded,
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
                                          color: Color.fromARGB(255, 86, 40, 3),
                                        ),
                                        child: const Text(
                                          "LMS",
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
                                    color: Color.fromARGB(193, 85, 32, 116),
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
                                          Icons.analytics_rounded,
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
                                              Color.fromARGB(193, 33, 12, 45),
                                        ),
                                        child: const Text(
                                          "Result",
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
                                      builder: (context) => const LibraryDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 98, 21, 45),
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
                                          color: Color.fromARGB(255, 36, 8, 17),
                                        ),
                                        child: const Text(
                                          "Library",
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
                                      builder: (context) => const HSDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 2, 29, 74),
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
                                          Icons.school_rounded,
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
                                          color: Color.fromARGB(255, 1, 16, 43),
                                        ),
                                        child: const Text(
                                          "Higher Studies",
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
                                          const HelpToolDash(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 5, 70, 71),
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
                                          Icons.handyman_rounded,
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
                                          color: Color.fromARGB(255, 7, 58, 63),
                                        ),
                                        child: const Text(
                                          "Helpful Tools",
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
                                      builder: (context) => const OthersPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 41, 70, 29),
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
                                          Icons.dynamic_feed_rounded,
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
                                              Color.fromARGB(255, 28, 46, 21),
                                        ),
                                        child: const Text(
                                          "Others",
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
                )
              ],
            ),
          );
        });
  }
}
