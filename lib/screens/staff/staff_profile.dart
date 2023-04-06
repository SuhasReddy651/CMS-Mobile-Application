import '../options_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StaffProf extends StatefulWidget {
  const StaffProf({super.key});

  @override
  State<StaffProf> createState() => _StaffProf();
}

class _StaffProf extends State<StaffProf> {
  @override
  Widget build(BuildContext context) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: const CircularProgressIndicator());
          }
          final data = snapshot.data!.data();
          final photo = data!['photo'],
              name = data['name'],
              eid = data['id'],
              department = data['dept'],
              phone = data['phone'],
              mail = data['mail'],
              blood = data['blood'];

          // ignore: avoid_unnecessary_containers
          return Container(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 80,
                        ),
                        alignment: Alignment.topCenter,
                        child: const Text(
                          "Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(30),
                        height: 160,
                        width: 160,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(photo),
                          radius: 200,
                        ),
                      ),
                    ],
                  )),
                ),
                Positioned(
                    top: 320,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(15),
                            child: const Text(
                              "Staff Name",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 47, 47, 47),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 20, right: 15, left: 15, bottom: 15),
                            child: const Text(
                              "Employee Id  Number",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 47, 47, 47),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              eid,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 20, right: 15, left: 15, bottom: 15),
                            child: const Text(
                              "Department",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 47, 47, 47),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              department,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 20, right: 15, left: 15, bottom: 15),
                            child: const Text(
                              "Phone Number",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 47, 47, 47),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              phone,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 20, right: 15, left: 15, bottom: 15),
                            child: const Text(
                              "E-mail",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 47, 47, 47),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              mail,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 20, right: 15, left: 15, bottom: 15),
                            child: const Text(
                              "Blood Group",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 350,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 47, 47, 47),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              blood,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    backgroundColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    content: const Text(
                                      'Do you want to sign out of the application?',
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    alignment: Alignment.center,
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromRGBO(
                                                  0, 113, 227, 1)),
                                        ),
                                        onPressed: () {
                                          FirebaseAuth.instance.signOut();
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const OptionsPage()),
                                            (Route<dynamic> route) => false,
                                          );
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Colors.black87,
                                                  content: const Text(
                                                    'You have sucess fully signed out',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      child: const Text(
                                                        'OK',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    113,
                                                                    227,
                                                                    1)),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'No',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromRGBO(
                                                  0, 113, 227, 1)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 20.0,
                              ),
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromRGBO(0, 113, 227, 1)),
                              alignment: Alignment.center,
                              child: const Text(
                                "SIGN OUT",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
