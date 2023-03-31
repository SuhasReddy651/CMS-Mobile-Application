import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
        backgroundColor: const Color.fromRGBO(0, 113, 227, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
          weight: 200,
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "You have no saved Notes !",
                  style: TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                ),
              );
            }

            return Scaffold(
              body: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Color bg = const Color.fromARGB(221, 55, 55, 55);
                    Map? data = snapshot.data?.docs[index].data() as Map?;
                    DateTime mydateTime = data!['created'].toDate();
                    String formattedTime =
                        DateFormat.yMMMd().add_jm().format(mydateTime);

                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => ViewNote(
                              data,
                              formattedTime,
                              snapshot.data!.docs[index].reference,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data['title']}",
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(221, 255, 255, 255),
                                ),
                              ),
                              //
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'Created On: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromARGB(221, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      formattedTime,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color:
                                            Color.fromARGB(221, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ],
                              )
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

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(
              12.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(0, 57, 57, 57),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 8.0,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 25.0,
                      ),
                    ),
                    //
                    ElevatedButton(
                        onPressed: add,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(0, 57, 57, 57),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 8.0,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.save,
                          size: 25,
                        )),
                  ],
                ),
                //
                const SizedBox(
                  height: 12.0,
                ),
                //
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(
                            hintText: "Title",
                          ),
                          style: const TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          // ignore: no_leading_underscores_for_local_identifiers
                          onChanged: (_val) {
                            title = _val;
                          },
                        ),
                      ),
                      //
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        padding: const EdgeInsets.only(top: 12.0),
                        margin: const EdgeInsets.only(left: 25.0),
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(
                            hintText: "Description",
                          ),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                          // ignore: no_leading_underscores_for_local_identifiers
                          onChanged: (_val) {
                            des = _val;
                          },
                          maxLines: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void add() async {
    // save to db
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    var data = {
      'title': title,
      'description': des,
      'created': DateTime.now(),
    };

    ref.add(data);

    //

    Navigator.pop(context);
  }
}

class ViewNote extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;

  const ViewNote(this.data, this.time, this.ref, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  late String title;
  late String des;

  bool edit = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    title = widget.data['title'];
    des = widget.data['description'];
    return SafeArea(
      child: Scaffold(
        //
        floatingActionButton: edit
            ? FloatingActionButton(
                onPressed: save,
                backgroundColor: const Color.fromRGBO(0, 113, 227, 1),
                child: const Icon(
                  Icons.save_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              )
            : null,
        //
        resizeToAvoidBottomInset: false,
        //
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(
              12.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(0, 0, 0, 0),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 8.0,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 25.0,
                      ),
                    ),
                    //
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              edit = !edit;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(0, 0, 0, 0),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 8.0,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 25.0,
                          ),
                        ),
                        //
                        const SizedBox(
                          width: 8.0,
                        ),
                        //
                        ElevatedButton(
                          onPressed: delete,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(0, 0, 0, 0),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 8.0,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.delete_forever,
                            size: 25.0,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 12.0,
                ),
                //
                Form(
                  key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 25,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(
                            hintText: "Title",
                          ),
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          initialValue: widget.data['title'],
                          enabled: edit,
                          // ignore: no_leading_underscores_for_local_identifiers
                          onChanged: (_val) {
                            title = _val;
                          },
                          // ignore: no_leading_underscores_for_local_identifiers
                          validator: (_val) {
                            if (_val!.isEmpty) {
                              return "Can't be empty !";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      //
                      Container(
                        margin: const EdgeInsets.only(
                          top: 12,
                          left: 25,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                    bottom: 12,
                                  ),
                                  child: const Text(
                                    'Created On:  ',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(
                                    bottom: 12,
                                  ),
                                  child: Text(
                                    widget.time,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //

                            TextFormField(
                              decoration: const InputDecoration.collapsed(
                                hintText: "Note Description",
                              ),
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                              initialValue: widget.data['description'],
                              enabled: edit,
                              // ignore: no_leading_underscores_for_local_identifiers
                              onChanged: (_val) {
                                des = _val;
                              },
                              maxLines: 20,
                              // ignore: no_leading_underscores_for_local_identifiers
                              validator: (_val) {
                                if (_val!.isEmpty) {
                                  return "Can't be empty !";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete() async {
    // delete from db
    await widget.ref.delete();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  void save() async {
    if (key.currentState!.validate()) {
      // TODo : showing any kind of alert that new changes have been saved
      await widget.ref.update(
        {'title': title, 'description': des},
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }
}
