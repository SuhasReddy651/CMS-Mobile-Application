import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LibraryDash extends StatefulWidget {
  const LibraryDash({super.key});

  @override
  State<LibraryDash> createState() => _LibraryDashState();
}

class _LibraryDashState extends State<LibraryDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Library",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Colllib()));
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
                    "College Library",
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
                      builder: (context) => const FreeBooks(),
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
                    "Free Books",
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
                      builder: (context) => const FreeJournals(),
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
                    "Free Journals",
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

class Colllib extends StatefulWidget {
  const Colllib({super.key});

  @override
  State<Colllib> createState() => _ColllibState();
}

class _ColllibState extends State<Colllib> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("College Library"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 42, 41, 41),
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

class FreeBooks extends StatelessWidget {
  const FreeBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Books"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse("https://www.pdfdrive.com/")),
      ),
    );
  }
}

class FreeJournals extends StatelessWidget {
  const FreeJournals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Journals"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://sci-hub.se/")),
      ),
    );
  }
}
