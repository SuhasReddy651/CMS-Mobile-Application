import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StuAttenDash extends StatefulWidget {
  const StuAttenDash({super.key});

  @override
  State<StuAttenDash> createState() => _StuAttenDashState();
}

class _StuAttenDashState extends State<StuAttenDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Attendance",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
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
                      builder: (context) => const DailyAtt(),
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
                      color: const Color.fromARGB(255, 128, 19, 51)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Daily Attendance",
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
                      builder: (context) => const AttReport(),
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
                      color: const Color.fromARGB(255, 128, 19, 51)),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                margin: const EdgeInsets.only(top: 20.0, bottom: 0),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/logo2.png",
                  height: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DailyAtt extends StatefulWidget {
  const DailyAtt({super.key});

  @override
  State<DailyAtt> createState() => _DailyAttState();
}

class _DailyAttState extends State<DailyAtt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Attendance"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

class AttReport extends StatefulWidget {
  const AttReport({super.key});

  @override
  State<AttReport> createState() => _AttReportState();
}

class _AttReportState extends State<AttReport> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('attendance');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance Report"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ignore: prefer_is_empty
            if (snapshot.data?.docs.length == 0) {
              return const Center(
                child: Text(
                  "You have no attendance history to show !",
                  style: TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                ),
              );
            }

            return Scaffold(
              body: Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    // ignore: unnecessary_new, unused_local_variable
                    Color bg = const Color.fromARGB(221, 55, 55, 55);
                    Map? data = snapshot.data?.docs[index].data() as Map?;

                    return InkWell(
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        color: bg,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${data!['date']}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(221, 255, 255, 255),
                                ),
                              ),
                              //
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Loading..."),
            );
          }
        },
      ),
    );
  }
}
