import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class StaffTT extends StatefulWidget {
  const StaffTT({super.key});

  @override
  State<StaffTT> createState() => _StaffTTState();
}

class _StaffTTState extends State<StaffTT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Time Table",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StaffRegTT()));
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 92, 44, 85)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Regular Time Table",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StaffEventCal()));
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 92, 44, 85)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Event Calender",
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
                  top: 20.0,
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

class StaffRegTT extends StatefulWidget {
  const StaffRegTT({super.key});

  @override
  State<StaffRegTT> createState() => _StaffRegTTState();
}

class _StaffRegTTState extends State<StaffRegTT> {
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
            return const CircularProgressIndicator();
          }
          final data = snapshot.data!.data();
          final photo = data!['ttable'];
          return Scaffold(
            appBar: AppBar(
              title: const Text('Time Table'),
              backgroundColor: Colors.black,
            ),
            body: Container(
                child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(photo)),
            )),
          );
        });
  }
}

class StaffEventCal extends StatefulWidget {
  const StaffEventCal({super.key});

  @override
  State<StaffEventCal> createState() => _StaffEventCalState();
}

class _StaffEventCalState extends State<StaffEventCal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Table'),
        backgroundColor: Colors.black,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse(
                  'https://firebasestorage.googleapis.com/v0/b/cmsapplication-19fd8.appspot.com/o/calendar.pdf?alt=media&token=6a43805d-c448-4cbf-a780-554c5bf35e29')),
        ),
      ),
    );
  }
}
