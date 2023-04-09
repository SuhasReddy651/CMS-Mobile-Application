import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/common%20screens/empty_page.dart';
import '../common screens/results_page.dart';
import '../common screens/search.dart';

class StudentInfo extends StatelessWidget {
  const StudentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Student Information",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 19, 106, 128),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Search Page",
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
                          builder: (context) => StudentResultsView()));
                },
                child: Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(30.0),
                  height: 100,
                  width: 900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 19, 106, 128),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Student Results",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StudentResultsView extends StatelessWidget {
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  StudentResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Results'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.where('class', isEqualTo: 'Student').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final userData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              final userid = userData['uid'];

              return ListTile(
                minVerticalPadding: 20,
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(userData['photo'])),
                title: Text(userData['name']),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        backgroundColor: const Color.fromARGB(144, 47, 47, 47),
                        title: const Text(
                          'Choose an action',
                          textAlign: TextAlign.center,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('View Results'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StfStuResView(
                                          userid: userData['uid'],
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
    );
  }
}

// ignore: must_be_immutable
class StfStuResView extends StatefulWidget {
  final String userid;
  const StfStuResView({super.key, required this.userid});

  @override
  State<StfStuResView> createState() => _StfStuResViewState();
}

class _StfStuResViewState extends State<StfStuResView> {
  @override
  Widget build(BuildContext context) {
    String user = widget.userid;
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(user)
        .collection('results');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // ignore: prefer_is_empty
            if (snapshot.data?.docs.length == 0) {
              return const Center(
                child: Text(
                  "You have no Results to show !",
                  style: TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                ),
              );
            }

            return Scaffold(
              body: Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    // ignore: unnecessary_new, unused_local_variable
                    Color bg = const Color.fromARGB(221, 55, 55, 55);
                    Map? data = snapshot.data?.docs[index].data() as Map?;

                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => ViewResult(
                              name: "${data['exam']}",
                              id: snapshot.data!.docs[index].id,
                              userid: user,
                            ),
                          ),
                        )
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        color: bg,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${data!['exam']}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(221, 255, 255, 255),
                                ),
                              ),
                              //
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Loading..."),
            );
          }
        },
      ),
    );
  }
}

class ViewResult extends StatelessWidget {
  final String name;
  final String id;
  final String userid;
  const ViewResult(
      {super.key, required this.name, required this.id, required this.userid});

  @override
  Widget build(BuildContext context) {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance
            .collection('users')
            .doc(userid)
            .collection('results');
    DocumentReference<Map<String, dynamic>> documentReference =
        collectionReference.doc(id);

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: documentReference.snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        Map<String, dynamic>? documentData = snapshot.data!.data();
        if (documentData == null) {
          return const Center(
            child: Text('Document data is empty.'),
          );
        }

        Map<String, dynamic>? mapData = documentData['marks'];
        if (mapData == null) {
          return const Center(
            child: Text('Map data is empty.'),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(name),
            backgroundColor: Colors.black,
          ),
          body: Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Center(
              child: ListView.builder(
                itemCount: mapData.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = mapData.keys.elementAt(index);
                  dynamic value = mapData[key];

                  return ListTile(
                    title: Text(
                      '$key :\n $value',
                      style: const TextStyle(fontSize: 20),
                    ),
                    style: ListTileStyle.list,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
