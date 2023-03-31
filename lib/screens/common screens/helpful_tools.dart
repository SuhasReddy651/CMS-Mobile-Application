import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'notes_portal.dart';

class HelpToolDash extends StatefulWidget {
  const HelpToolDash({super.key});

  @override
  State<HelpToolDash> createState() => _HelpToolDashState();
}

class _HelpToolDashState extends State<HelpToolDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Helpful Tools",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                            builder: (context) => const ChatGPT(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 14, 154, 84),
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
                              child: Image.asset(
                                "assets/cgpt.png",
                                color: const Color.fromARGB(255, 223, 222, 222),
                                height: 80,
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
                                color: Color.fromARGB(255, 7, 81, 44),
                              ),
                              child: const Text(
                                "Chat GPT",
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
                            builder: (context) => const Udemy(),
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
                              child: Image.asset(
                                "assets/udemy.png",
                                color: const Color.fromARGB(255, 197, 196, 196),
                                height: 80,
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
                                "Udemy",
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
                            builder: (context) => const Coursera(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 20, 76, 154),
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
                              child: Image.asset(
                                "assets/coursera.png",
                                color: const Color.fromARGB(255, 196, 196, 197),
                                height: 80,
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
                                color: Color.fromARGB(255, 14, 49, 99),
                              ),
                              child: const Text(
                                "Coursera",
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
                            builder: (context) => const DocTools(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(204, 193, 17, 17),
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
                                Icons.file_copy_rounded,
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
                                color: Color.fromARGB(201, 87, 9, 9),
                              ),
                              child: const Text(
                                "Document Tools",
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
                            builder: (context) => const DocScanner(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 180, 80, 4),
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
                                Icons.document_scanner_rounded,
                                color: Color.fromARGB(255, 223, 222, 222),
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
                                color: Color.fromARGB(255, 97, 43, 1),
                              ),
                              child: const Text(
                                "Doc Scanner",
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
                            builder: (context) => const NotesApp(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(210, 183, 174, 8),
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
                                Icons.notes_rounded,
                                color: Color.fromARGB(255, 238, 236, 236),
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
                                color: Color.fromARGB(210, 106, 101, 5),
                              ),
                              child: const Text(
                                "Notes",
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
                            builder: (context) => const Swayam(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(199, 4, 83, 194),
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
                              child: Image.asset(
                                "assets/nptel.png",
                                color: const Color.fromARGB(255, 196, 196, 197),
                                height: 80,
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
                                color: Color.fromARGB(255, 14, 49, 99),
                              ),
                              child: const Text(
                                "SWAYAM",
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
                            builder: (context) => const FreeCourses(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(168, 93, 49, 149),
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
                              child: Image.asset(
                                "assets/courses.png",
                                color: const Color.fromARGB(255, 197, 196, 196),
                                height: 80,
                                width: 100,
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
                                color: Color.fromARGB(168, 40, 22, 64),
                              ),
                              child: const Text(
                                "Free Courses",
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
                            builder: (context) => const SkillShare(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 14, 150, 75),
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
                              child: Image.asset(
                                "assets/skillshare.png",
                                color: const Color.fromARGB(255, 223, 222, 222),
                                height: 80,
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
                                color: Color.fromARGB(255, 16, 86, 47),
                              ),
                              child: const Text(
                                "Skill Share",
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
                            builder: (context) => const Brainly(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(210, 31, 143, 187),
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
                              child: Image.asset(
                                "assets/brainly.png",
                                height: 70,
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
                                color: Color.fromARGB(210, 23, 96, 124),
                              ),
                              child: const Text(
                                "Brainly",
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
    );
  }
}

class ChatGPT extends StatefulWidget {
  const ChatGPT({super.key});

  @override
  State<ChatGPT> createState() => _ChatGPTState();
}

class _ChatGPTState extends State<ChatGPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Chat GPT"),
      ),
      body: SizedBox(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://chat.openai.com/chat'),
          ),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              allowFileAccess: true,
              allowContentAccess: true,
              cacheMode: AndroidCacheMode.LOAD_NO_CACHE,
              builtInZoomControls: true,
              displayZoomControls: false,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
              allowsAirPlayForMediaPlayback: true,
              allowsBackForwardNavigationGestures: true,
              allowsLinkPreview: true,
              ignoresViewportScaleLimits: false,
            ),
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
          ),
        ),
      ),
    );
  }
}

class Coursera extends StatefulWidget {
  const Coursera({super.key});

  @override
  State<Coursera> createState() => _CourseraState();
}

class _CourseraState extends State<Coursera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Coursera"),
      ),
      body: SizedBox(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://www.coursera.com'),
          ),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              allowFileAccess: true,
              allowContentAccess: true,
              cacheMode: AndroidCacheMode.LOAD_NO_CACHE,
              builtInZoomControls: true,
              displayZoomControls: false,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
              allowsAirPlayForMediaPlayback: true,
              allowsBackForwardNavigationGestures: true,
              allowsLinkPreview: true,
              ignoresViewportScaleLimits: false,
            ),
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
          ),
        ),
      ),
    );
  }
}

class Udemy extends StatefulWidget {
  const Udemy({super.key});

  @override
  State<Udemy> createState() => _UdemyState();
}

class _UdemyState extends State<Udemy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Udemy"),
      ),
      body: SizedBox(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://www.udemy.com'),
          ),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
          ),
        ),
      ),
    );
  }
}

class DocTools extends StatefulWidget {
  const DocTools({super.key});

  @override
  State<DocTools> createState() => _DocToolsState();
}

class _DocToolsState extends State<DocTools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Document Tools"),
      ),
      body: SizedBox(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://www.ilovepdf.com/'),
          ),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              allowFileAccess: true,
              allowContentAccess: true,
              cacheMode: AndroidCacheMode.LOAD_NO_CACHE,
              builtInZoomControls: true,
              displayZoomControls: false,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
              allowsAirPlayForMediaPlayback: true,
              allowsBackForwardNavigationGestures: true,
              allowsLinkPreview: true,
              ignoresViewportScaleLimits: false,
            ),
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
              useOnDownloadStart: true,
            ),
          ),
        ),
      ),
    );
  }
}

class DocScanner extends StatefulWidget {
  const DocScanner({super.key});

  @override
  State<DocScanner> createState() => _DocScannerState();
}

class _DocScannerState extends State<DocScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Document Scanner"),
      ),
      body: SizedBox(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse("https://scandoc.io/"),
          ),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              allowFileAccess: true,
              allowContentAccess: true,
              cacheMode: AndroidCacheMode.LOAD_NO_CACHE,
              builtInZoomControls: true,
              displayZoomControls: false,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
              allowsAirPlayForMediaPlayback: true,
              allowsBackForwardNavigationGestures: true,
              allowsLinkPreview: true,
              ignoresViewportScaleLimits: false,
            ),
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
          ),
        ),
      ),
    );
  }
}

class Swayam extends StatelessWidget {
  const Swayam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swayam"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://swayam.gov.in/"),
        ),
      ),
    );
  }
}

class FreeCourses extends StatelessWidget {
  const FreeCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Central"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            "https://www.classcentral.com/",
          ),
        ),
      ),
    );
  }
}

class SkillShare extends StatelessWidget {
  const SkillShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skill Share"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            "https://www.skillshare.com/en/browse?via=header",
          ),
        ),
      ),
    );
  }
}

class Brainly extends StatelessWidget {
  const Brainly({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skill Share"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            "https://brainly.in/",
          ),
        ),
      ),
    );
  }
}
