import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class OthersPage extends StatefulWidget {
  const OthersPage({super.key});

  @override
  State<OthersPage> createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Others",
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
                      builder: (context) => const BusRoutes(),
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
                      color: const Color.fromARGB(255, 0, 75, 87)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Bus Routes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MessMenu(),
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
                      color: const Color.fromARGB(255, 0, 75, 87)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Mess Menu",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
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
                      builder: (context) => const HallTicket(),
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
                      color: const Color.fromARGB(255, 0, 75, 87)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Hall Ticket",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
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
                      builder: (context) => const IDCard(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 30.0,
                    left: 30.0,
                    right: 30.0,
                  ),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 0, 75, 87)),
                  alignment: Alignment.center,
                  child: const Text(
                    "ID Card",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
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

class BusRoutes extends StatelessWidget {
  const BusRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus Routes"),
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

class MessMenu extends StatelessWidget {
  const MessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mess Menu"),
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

class HallTicket extends StatelessWidget {
  const HallTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hall Ticket"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              "https://drive.google.com/file/d/1zLAdr81MSPNwur3SpWGGCRPxG-ieHDFv/view?usp=sharing"),
        ),
      ),
    );
  }
}

class IDCard extends StatelessWidget {
  const IDCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ID Card"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              "https://drive.google.com/file/d/1zLAdr81MSPNwur3SpWGGCRPxG-ieHDFv/view?usp=sharing"),
        ),
      ),
    );
  }
}
