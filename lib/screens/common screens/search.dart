import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  late Stream<QuerySnapshot> _searchResultsStream;

  @override
  void initState() {
    super.initState();
    _searchResultsStream = FirebaseFirestore.instance
        .collectionGroup('users')
        .orderBy('name')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              alignment: Alignment.center,
              child: const Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 400,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 47, 47, 47),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for users...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (String query) {
                    setState(() {
                      _searchResultsStream = FirebaseFirestore.instance
                          .collectionGroup('users')
                          .orderBy('name')
                          .where('name', isGreaterThanOrEqualTo: query)
                          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
                          .snapshots();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _searchResultsStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final document = documents[index];
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(document['photo'])),
                        title: Text(document['name']),
                        subtitle:
                            Text(document['class'] + ' - ' + document['dept']),
                        trailing: document['class'] == 'Student'
                            // ignore: prefer_interpolation_to_compose_strings
                            ? Text('B.Eng. - ' + document['year'])
                            : null,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                actionsAlignment:
                                    MainAxisAlignment.spaceBetween,
                                backgroundColor:
                                    const Color.fromARGB(144, 47, 47, 47),
                                title: const Text(
                                  'Choose an action',
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('View profile'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProfileView(
                                                  userid: document['uid'],
                                                )),
                                      );
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileView extends StatefulWidget {
  final String userid;
  const ProfileView({super.key, required this.userid});

  @override
  State<ProfileView> createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    String currentUserId = widget.userid;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const CircularProgressIndicator();
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
          return Scaffold(
            body: Stack(
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
                              "Name",
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
                              "Id  Number",
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
                        ],
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
