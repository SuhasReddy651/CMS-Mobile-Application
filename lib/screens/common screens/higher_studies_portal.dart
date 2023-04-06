import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HSDash extends StatelessWidget {
  const HSDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Higher Studies",
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
                          builder: (context) => const NewsnInfo(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 65, 64, 63),
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
                              Icons.newspaper,
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
                              color: Color.fromARGB(255, 44, 43, 43),
                            ),
                            child: const Text(
                              "News and Info.",
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
                          builder: (context) => const LORForm(),
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
                              Icons.edit_document,
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
                              "LOR Form",
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
                          builder: (context) => const PrepDash(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(188, 2, 118, 91),
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
                              Icons.local_library_rounded,
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
                              color: Color.fromARGB(187, 1, 49, 38),
                            ),
                            child: const Text(
                              "Prep. Material",
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
                          builder: (context) => const UsefulSites(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(193, 28, 55, 109),
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
                              Icons.language_rounded,
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
                              color: Color.fromARGB(193, 12, 23, 45),
                            ),
                            child: const Text(
                              "Useful Sites",
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

class LORForm extends StatelessWidget {
  const LORForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOR Form"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://drive.google.com/file/d/1yXX_gCmIIPC0dJGn9BY9KpxsbJ-THpX-/view?usp=sharing")),
      ),
    );
  }
}

class NewsnInfo extends StatefulWidget {
  const NewsnInfo({super.key});

  @override
  State<NewsnInfo> createState() => _NewsnInfoState();
}

class _NewsnInfoState extends State<NewsnInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News and Information"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.grey,
        ));
  }
}

class PrepDash extends StatefulWidget {
  const PrepDash({super.key});

  @override
  State<PrepDash> createState() => _PrepDashState();
}

class _PrepDashState extends State<PrepDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prep. Material",
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
                          builder: (context) => const GRE(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 3, 59, 164),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Image.asset(
                              "assets/GRE.png",
                              color: const Color.fromARGB(255, 255, 255, 255),
                              height: 70,
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
                          builder: (context) => const GMAT(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 170, 145, 21),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Image.asset(
                              "assets/GMAT.png",
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 160,
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
                          builder: (context) => const PTE(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(198, 0, 85, 183),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: const Text(
                                "PTE",
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Arial Bold",
                                ),
                              )),
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
                          builder: (context) => const TOEFL(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 65, 64, 63),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Image.asset(
                              "assets/TOEFL.png",
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 160,
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
                          builder: (context) => const IELTS(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(199, 183, 0, 0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset(
                              "assets/IELTS.png",
                              color: Colors.white,
                              width: 120,
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
                          builder: (context) => const Duolingo(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(200, 88, 204, 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset(
                              "assets/duolingo.png",
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 160,
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

class UsefulSites extends StatefulWidget {
  const UsefulSites({super.key});

  @override
  State<UsefulSites> createState() => _UsefulSitesState();
}

class _UsefulSitesState extends State<UsefulSites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Useful Sites",
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
                          builder: (context) => const QS(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(185, 210, 200, 0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: Image.asset(
                              "assets/QS.png",
                              color: const Color.fromARGB(255, 255, 255, 255),
                              height: 70,
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
                          builder: (context) => const USNews(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 72, 172),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          SizedBox(
                            child: Text(
                              "U.S.News",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Impact",
                                  decoration: TextDecoration.underline),
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
                          builder: (context) => const Forbes(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(198, 0, 85, 183),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset(
                              "assets/Forbes.png",
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 150,
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
                          builder: (context) => const Yocket(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(230, 200, 100, 0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset(
                              "assets/yocket.png",
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 150,
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
                          builder: (context) => const Shiksha(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(198, 0, 162, 151),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset(
                              "assets/shiksha.png",
                              color: Colors.white,
                              width: 120,
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
                          builder: (context) => const OthLinks(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(197, 93, 32, 32),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      height: 251,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          SizedBox(
                            child: Text(
                              "Others",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Impact",
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

class EnglishLink extends StatelessWidget {
  const EnglishLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://www.youtube.com/@ParthVijayvergiya/playlists&t=As")),
      ),
    );
  }
}

class HindiLink extends StatelessWidget {
  const HindiLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://www.youtube.com/playlist?list=PLSEVSd03IXCwAumpPORrivNDMbTr8o3wf")),
      ),
    );
  }
}

class TeluguLink extends StatelessWidget {
  const TeluguLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://www.youtube.com/playlist?list=PLZCj0qfI2XQXkxd6TVpdBWz4OWlr-s2XW")),
      ),
    );
  }
}

class TamilLink extends StatelessWidget {
  const TamilLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://www.youtube.com/playlist?list=PLSEVSd03IXCzAJM6Rhfg_ivnlzH7crStA")),
      ),
    );
  }
}

class GRE extends StatelessWidget {
  const GRE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GRE"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://drive.google.com/drive/folders/1b6356GARhTRnJHowmFlrhiEqUr2H-Hwj?usp=sharing")),
      ),
    );
  }
}

class GMAT extends StatelessWidget {
  const GMAT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GMAT"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://drive.google.com/drive/folders/1cFmn1WCqahvlyU2VGzvu2neSaFywZTDK?usp=sharing")),
      ),
    );
  }
}

class PTE extends StatelessWidget {
  const PTE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PTE"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://drive.google.com/drive/folders/11e6S5xrp2LHZIJM98-jeVcbDuFl0dX5h?usp=sharing")),
      ),
    );
  }
}

class TOEFL extends StatelessWidget {
  const TOEFL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TOEFL"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://drive.google.com/drive/folders/15zNpvNjuaMf_61ZSiflpNkTNB8xJ3wP_?usp=sharing")),
      ),
    );
  }
}

class IELTS extends StatelessWidget {
  const IELTS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IELTS"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://drive.google.com/drive/folders/1MOyxfMqjuZXfXdQFrMB1Eabnrb3s0v_x?usp=sharing")),
      ),
    );
  }
}

class Duolingo extends StatelessWidget {
  const Duolingo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Duolingo"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://drive.google.com/drive/folders/13DCPEW26Vhm1NZJZcniRuCGFyYifabaI?usp=sharing")),
      ),
    );
  }
}

class QS extends StatelessWidget {
  const QS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QS World Rankings"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            "https://www.topuniversities.com/",
          ),
        ),
      ),
    );
  }
}

class USNews extends StatelessWidget {
  const USNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("US News Rankings"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            "https://www.usnews.com/best-colleges",
          ),
        ),
      ),
    );
  }
}

class Forbes extends StatelessWidget {
  const Forbes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forbes Rankings"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
          "https://www.forbes.com/top-colleges/",
        )),
      ),
    );
  }
}

class Yocket extends StatelessWidget {
  const Yocket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yocket"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
          "https://yocket.com/",
        )),
      ),
    );
  }
}

class Shiksha extends StatelessWidget {
  const Shiksha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shiksha Study Abroad"),
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
          "https://studyabroad.shiksha.com/",
        )),
      ),
    );
  }
}

class OthLinks extends StatefulWidget {
  const OthLinks({super.key});

  @override
  State<OthLinks> createState() => _OthLinksState();
}

class _OthLinksState extends State<OthLinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Other Links",
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
              Container(
                margin: const EdgeInsets.only(top: 15.0, bottom: 15),
                alignment: Alignment.center,
                child: const Text(
                  "Links to related youtube videos in various languages",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EnglishLink()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 162, 16, 16)),
                        alignment: Alignment.center,
                        child: const Text(
                          "English",
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
                                builder: (context) => const HindiLink()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 24, 64, 46)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Hindi",
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
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeluguLink()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 144, 132, 1)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Telugu",
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
                                builder: (context) => const TamilLink()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 42, 9, 78)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Tamil",
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
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 5.0,
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
