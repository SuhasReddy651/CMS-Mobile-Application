import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/common%20screens/empty_page.dart';

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
      body: Column(
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AdminHome()));
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
        leading: Text(''),
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AttMangHome(),
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
                            Icons.checklist_rounded,
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
                            color: Color.fromARGB(255, 38, 65, 112),
                          ),
                          child: const Text(
                            "Attendance Management",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ]),
      ),
    );
  }
}

class AttMangHome extends StatefulWidget {
  static var registered;

  const AttMangHome({super.key});

  @override
  State<AttMangHome> createState() => _AttMangHomeState();
}

class _AttMangHomeState extends State<AttMangHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Icon(
                Icons.person_rounded,
                size: 200,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EmptyPage())); //registration
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth - 30, 50)),
                  child: const Text("Register"),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EmptyPage())); //Recognition
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth - 30, 50)),
                  child: const Text("Recognize"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
