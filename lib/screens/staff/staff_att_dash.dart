import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/attendance/self_button.dart';
import 'package:project/screens/attendance/staff_camera.dart';
import 'package:project/screens/attendance/stu_att_marking.dart';
import 'package:project/screens/staff/attendance_page.dart';
import '../common screens/empty_page.dart';

class StaffAttnDash extends StatefulWidget {
  const StaffAttnDash({super.key});

  @override
  State<StaffAttnDash> createState() => _StaffAttnDashState();
}

class _StaffAttnDashState extends State<StaffAttnDash> {
  String userID = FirebaseAuth.instance.currentUser?.uid as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Attendance",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelfButtonPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 19, 106, 128),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Self Attendance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentAttendance()));
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 19, 106, 128),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Student Attendance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentAttendance(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 19, 106, 128),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Attendance Report",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StuAttRep extends StatefulWidget {
  const StuAttRep({super.key});

  @override
  State<StuAttRep> createState() => _StuAttRepState();
}

class _StuAttRepState extends State<StuAttRep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Attendance Report",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 36, 36, 36),
        child: const Text(
          "This will be updated soon",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Georgia",
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
