import 'package:cloud_firestore/cloud_firestore.dart';
import './staff_dash.dart';
import '../common screens/discussions.dart';
import '../common screens/chat_portal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'staff_profile.dart';

class StaffHome extends StatefulWidget {
  const StaffHome({super.key});

  @override
  State<StaffHome> createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  late String name;
  int _selectedIndex = 0;

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

  PageController pageController = PageController();
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
          const StaffDash(),
          Discussions(
            name: name,
          ),
          ChatsHomeScreen(),
          const StaffProf(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
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
              Icons.messenger_rounded,
              size: 40,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 40,
            ),
            label: 'Profile',
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
