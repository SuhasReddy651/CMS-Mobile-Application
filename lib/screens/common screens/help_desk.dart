import 'package:flutter/material.dart';
import 'empty_page.dart';

class HelpDeskDash extends StatefulWidget {
  const HelpDeskDash({super.key});

  @override
  State<HelpDeskDash> createState() => _HelpDeskDashState();
}

class _HelpDeskDashState extends State<HelpDeskDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help Desk",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
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
                      builder: (context) => const FeedBack(),
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
                      color: const Color.fromARGB(255, 24, 64, 46)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Feedback",
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
                      builder: (context) => const GrievanceCell(),
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
                      color: const Color.fromARGB(255, 24, 64, 46)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Grievance Cell",
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
                      builder: (context) => const ARC(),
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
                      color: const Color.fromARGB(255, 24, 64, 46)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Anti-Ragging Cell",
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
                      builder: (context) => const Documents(),
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
                      color: const Color.fromARGB(255, 24, 64, 46)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Documents",
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
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
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
    );
  }
}

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(30.0),
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 64, 24, 64),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Staff",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(30.0),
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 64, 24, 64),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Subjects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(30.0),
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 64, 24, 64),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Food",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(30.0),
                height: 100,
                width: 900,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 64, 24, 64),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Hostel",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
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
    );
  }
}

class GrievanceCell extends StatefulWidget {
  const GrievanceCell({super.key});

  @override
  State<GrievanceCell> createState() => _GrievanceCellState();
}

class _GrievanceCellState extends State<GrievanceCell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grievance Cell",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 90,
            width: 350,
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              showCursor: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Complaint Brief',
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            height: 450,
            width: 350,
            margin: const EdgeInsets.only(
              bottom: 40,
              left: 40,
              right: 40,
            ),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              showCursor: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Full Complaint',
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EmptyPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              height: 75,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(0, 113, 227, 1)),
              alignment: Alignment.center,
              child: const Text(
                "SUBMIT",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ARC extends StatefulWidget {
  const ARC({super.key});

  @override
  State<ARC> createState() => _ARCState();
}

class _ARCState extends State<ARC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anti-Ragging Cell",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 90,
            width: 350,
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              showCursor: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Complaint Brief',
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            height: 450,
            width: 350,
            margin: const EdgeInsets.only(
              bottom: 40,
              left: 40,
              right: 40,
            ),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              showCursor: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Full Complaint',
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EmptyPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              height: 75,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(0, 113, 227, 1)),
              alignment: Alignment.center,
              child: const Text(
                "SUBMIT",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Documents",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 90,
            width: 350,
            margin: const EdgeInsets.all(40),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              showCursor: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Register Number',
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            height: 450,
            width: 350,
            margin: const EdgeInsets.only(
              bottom: 40,
              left: 40,
              right: 40,
            ),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              showCursor: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Documents List',
                hintStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EmptyPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              height: 75,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(0, 113, 227, 1)),
              alignment: Alignment.center,
              child: const Text(
                "SUBMIT",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
