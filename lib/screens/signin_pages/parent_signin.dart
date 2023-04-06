import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../parent/parent_dash.dart';

class ParentSignIn extends StatefulWidget {
  const ParentSignIn({super.key});

  @override
  State<ParentSignIn> createState() => _ParentSignInState();
}

class _ParentSignInState extends State<ParentSignIn> {
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
              "Parent Sign In",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const Text(
              "Enter your credentials to Sign In",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ParentDash()));
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
