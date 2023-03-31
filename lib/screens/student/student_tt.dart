import 'package:flutter/material.dart';

class TimeTabDash extends StatefulWidget {
  const TimeTabDash({super.key});

  @override
  State<TimeTabDash> createState() => _TimeTabDashState();
}

class _TimeTabDashState extends State<TimeTabDash> {
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
                          builder: (context) => const RegularTT()));
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 61, 44, 92)),
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
                          builder: (context) => const EventCal()));
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 61, 44, 92)),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
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
        ],
      ),
    );
  }
}

class RegularTT extends StatefulWidget {
  const RegularTT({super.key});

  @override
  State<RegularTT> createState() => _RegularTTState();
}

class _RegularTTState extends State<RegularTT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Regular Time Table"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 21, 21, 21),
        child: const Text(
          "This will be updated soon",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Georgia",
          ),
        ),
      ),
    );
  }
}

class EventCal extends StatefulWidget {
  const EventCal({super.key});

  @override
  State<EventCal> createState() => _EventCalState();
}

class _EventCalState extends State<EventCal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Calender"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 21, 21, 21),
        child: const Text(
          "This will be updated soon",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Georgia",
          ),
        ),
      ),
    );
  }
}
