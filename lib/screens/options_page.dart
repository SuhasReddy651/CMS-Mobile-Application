import 'package:flutter/material.dart';

import 'signin_pages/admin_signin.dart';
import 'signin_pages/parent_signin.dart';
import 'signin_pages/staff_signin.dart';
import 'signin_pages/student_signin.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: size.height * 0.85,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AdminSignIn(),
            ),
          );
        },
        child: const Icon(
          Icons.add_moderator_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image(
              image: const AssetImage('assets/logo2.png'),
              height: size.height * 0.15,
              width: size.width * 0.85,
            ),
          ),
          const Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const Text(
            "Sign in to use the App",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200,
              fontSize: 20,
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StaffSignIn()));
              },
              child: Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(20.0),
                height: size.height * 0.115,
                width: size.width * 0.80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromRGBO(26, 26, 26, 100)),
                alignment: Alignment.center,
                child: const Text(
                  "Staff",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 115, 217),
                    fontWeight: FontWeight.normal,
                    fontSize: 35,
                  ),
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentSignIn()));
              },
              child: Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(30.0),
                height: size.height * 0.115,
                width: size.width * 0.80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromRGBO(26, 26, 26, 100)),
                alignment: Alignment.center,
                child: const Text(
                  "Student",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 115, 217),
                    fontWeight: FontWeight.normal,
                    fontSize: 35,
                  ),
                ),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParentSignIn()));
              },
              child: Container(
                margin: const EdgeInsets.all(30.0),
                padding: const EdgeInsets.all(30.0),
                height: size.height * 0.115,
                width: size.width * 0.80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromRGBO(26, 26, 26, 100)),
                alignment: Alignment.center,
                child: const Text(
                  "Parent",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 115, 217),
                    fontWeight: FontWeight.normal,
                    fontSize: 35,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
