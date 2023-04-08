import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:project/screens/common%20screens/empty_page.dart';

import '../options_page.dart';
import '../parent/parent_dash.dart';

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({super.key});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                child: Image(
                  image: AssetImage('assets/logo2.png'),
                  height: 120,
                  width: 360,
                ),
              ),
            ),
            const Text(
              "Admininistrator",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const Text(
              "Sign in with your credentials",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.80,
              margin: EdgeInsets.only(
                top: size.height * 0.075,
              ),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 47, 47, 47),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: TextField(
                controller: _emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email ID',
                  hintStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.08,
              width: size.width * 0.80,
              margin: EdgeInsets.only(
                top: size.height * 0.04,
              ),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 47, 47, 47),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: TextField(
                controller: _passwordController,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () async {
                  try {
                    // ignore: unused_local_variable
                    UserCredential userCredential =
                        await _auth.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const AdminHome()),
                        (Route<dynamic> route) => false);
                  } on FirebaseAuthException catch (e) {
                    dynamic message = e.message;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          backgroundColor: Colors.black38,
                          content: Text(
                            message,
                            textAlign: TextAlign.center,
                          ),
                          alignment: Alignment.center,
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 113, 227, 1)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  height: 75,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(0, 113, 227, 1)),
                  alignment: Alignment.center,
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Text(" "),
        title: const Text(
          "Admin Portal",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              surfaceTintColor: Colors.grey,
              onSelected: (value) {
                if (value == 'signout') {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OptionsPage()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'signout',
                      child: Text('Sign out'),
                    ),
                  ])
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
                child: const Text(
                  "To access the management portals first check the credentials!",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CredentialsPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 104, 8, 8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  height: size.height * 0.3,
                  width: size.width * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          top: 75.0,
                        ),
                        child: const Icon(
                          Icons.password_rounded,
                          color: Color.fromARGB(255, 227, 227, 227),
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
                          color: Color.fromARGB(255, 74, 6, 6),
                        ),
                        child: const Text(
                          "Credentials",
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
                      builder: (context) => const DBMan(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 45, 131, 96),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  height: size.height * 0.3,
                  width: size.width * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          top: 75.0,
                        ),
                        child: const Icon(
                          Icons.storage_rounded,
                          color: Colors.white,
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
                          color: Color.fromARGB(255, 28, 80, 59),
                        ),
                        child: const Text(
                          "Database Management",
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
                      builder: (context) => const DSMan(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 64, 108, 186),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  height: size.height * 0.3,
                  width: size.width * 0.85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                          top: 75.0,
                        ),
                        child: const Icon(
                          Icons.cloud_rounded,
                          color: Colors.white,
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
                          color: Color.fromARGB(255, 38, 65, 112),
                        ),
                        child: const Text(
                          "Data Storage Management",
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
      ),
    );
  }
}

class CredentialsPage extends StatelessWidget {
  const CredentialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credentials"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              child: const Text(
                "Email ID",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 350,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 47, 47, 47),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              alignment: Alignment.center,
              child: const Text(
                "finalprojectsist@gmail.com",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(15),
              child: const Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 50,
              width: 350,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 47, 47, 47),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              alignment: Alignment.center,
              child: const Text(
                "FinalProject@123",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DBMan extends StatelessWidget {
  const DBMan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database Management"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "https://console.firebase.google.com/project/cms-cp-application/overview")),
      ),
    );
  }
}

class DSMan extends StatelessWidget {
  const DSMan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Storage Management"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse("https://drive.google.com/drive/my-drive")),
      ),
    );
  }
}
