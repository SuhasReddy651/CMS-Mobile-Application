import 'package:cloud_firestore/cloud_firestore.dart';
import '../common screens/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common screens/chat_portal.dart';
import '../common screens/discussions.dart';
import 'student_dash.dart';
import 'student_profile.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}

class User {
  final String? id;
  final String? displayName;

  User({required this.id, required this.displayName});
}

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  late final String name;
  String id = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((snapshot) {
      setState(() {
        name = snapshot.get('name');
      });
    });
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
    pageController.jumpToPage(
      index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          const StudentDash(),
          Discussions(name: name),
          const StuAccount(),
          ChatsHomeScreen(),
          const SearchScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_rounded),
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 40,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger_rounded,
              size: 40,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              size: 40,
            ),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(0, 113, 227, 1),
        iconSize: 40,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
