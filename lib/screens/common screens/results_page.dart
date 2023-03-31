import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:intl/intl.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('result');
  @override
  Widget build(BuildContext context) {
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
                                id: snapshot.data!.docs[index].id),
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
  const ViewResult({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection('result');
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
