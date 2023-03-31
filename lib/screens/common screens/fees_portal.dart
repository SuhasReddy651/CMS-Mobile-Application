import 'package:flutter/material.dart';

class FeesDash extends StatefulWidget {
  const FeesDash({super.key});

  @override
  State<FeesDash> createState() => _FeesDashState();
}

class _FeesDashState extends State<FeesDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fee Portal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                          builder: (context) => const TutionFees(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 27, 135, 112),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                              top: 75.0,
                            ),
                            child: const Icon(
                              Icons.school_rounded,
                              color: Color.fromARGB(255, 197, 196, 196),
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
                              color: Color.fromARGB(255, 14, 69, 57),
                            ),
                            child: const Text(
                              "Tution",
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
                          builder: (context) => const HostelFees(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                              top: 75.0,
                            ),
                            child: const Icon(
                              Icons.king_bed_outlined,
                              color: Color.fromARGB(255, 197, 196, 196),
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
                              color: Color.fromARGB(193, 33, 12, 45),
                            ),
                            child: const Text(
                              "Hostel",
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
                          builder: (context) => const PlacementFees(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 42, 46, 116),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                              top: 75.0,
                            ),
                            child: const Icon(
                              Icons.work,
                              color: Color.fromARGB(255, 197, 196, 196),
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
                              color: Color.fromARGB(255, 24, 26, 67),
                            ),
                            child: const Text(
                              "Placement",
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
                          builder: (context) => const ExamFees(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(193, 157, 36, 56),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(
                              top: 75.0,
                            ),
                            child: const Icon(
                              Icons.fact_check_rounded,
                              color: Color.fromARGB(255, 197, 196, 196),
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
                              color: Color.fromARGB(193, 88, 20, 31),
                            ),
                            child: const Text(
                              "Exam",
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
            Column(
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
      ),
    );
  }
}

class TutionFees extends StatefulWidget {
  const TutionFees({super.key});

  @override
  State<TutionFees> createState() => _TutionFeesState();
}

class _TutionFeesState extends State<TutionFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tution Fees"),
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

class HostelFees extends StatefulWidget {
  const HostelFees({super.key});

  @override
  State<HostelFees> createState() => _HostelFeesState();
}

class _HostelFeesState extends State<HostelFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hostel Fees"),
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

class PlacementFees extends StatefulWidget {
  const PlacementFees({super.key});

  @override
  State<PlacementFees> createState() => _PlacementFeesState();
}

class _PlacementFeesState extends State<PlacementFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Placement Fees"),
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

class ExamFees extends StatefulWidget {
  const ExamFees({super.key});

  @override
  State<ExamFees> createState() => _ExamFeesState();
}

class _ExamFeesState extends State<ExamFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exam Fees",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ArrearFees(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                    bottom: 30.0,
                    left: 30,
                    right: 30,
                  ),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 6, 57, 105)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Arrear Exam Fees",
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
                      builder: (context) => const RevalFees(),
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
                      color: const Color.fromARGB(255, 6, 57, 105)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Revaluation Fees",
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
    );
  }
}

class ArrearFees extends StatefulWidget {
  const ArrearFees({super.key});

  @override
  State<ArrearFees> createState() => _ArrearFeesState();
}

class _ArrearFeesState extends State<ArrearFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arrear Exam Fees"),
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

class RevalFees extends StatefulWidget {
  const RevalFees({super.key});

  @override
  State<RevalFees> createState() => _RevalFeesState();
}

class _RevalFeesState extends State<RevalFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revaluation Fees"),
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
