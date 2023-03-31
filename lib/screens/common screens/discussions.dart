import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Discussions extends StatefulWidget {
  String name;
  Discussions({super.key, required this.name});
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _DiscussionsState createState() => _DiscussionsState(name: name);
}

class _DiscussionsState extends State<Discussions> {
  String name;
  _DiscussionsState({required this.name});

  final fs = FirebaseFirestore.instance;
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.14,
              child: const Text(
                'Discussions Forum',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: messages(
                name: name,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 5,
              left: 5,
              right: 5,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * 0.11,
                  width: MediaQuery.of(context).size.width * 0.82,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 47, 47, 47),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: TextFormField(
                    controller: message,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'message',
                      enabled: true,
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                Transform.rotate(
                  angle: 5.37,
                  child: IconButton(
                    onPressed: () {
                      if (message.text.isNotEmpty) {
                        fs.collection('discussions').doc().set({
                          'message': message.text.trim(),
                          'time': DateTime.now(),
                          'name': name,
                        });

                        message.clear();
                      }
                    },
                    icon: const Icon(
                      Icons.send_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class messages extends StatefulWidget {
  String name;
  messages({super.key, required this.name});
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _messagesState createState() => _messagesState(name: name);
}

// ignore: camel_case_types
class _messagesState extends State<messages> {
  String name;
  _messagesState({required this.name});
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('discussions')
      .orderBy('time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              itemCount: snapshot.data!.docs.length,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              reverse: false,
              itemBuilder: (_, index) {
                QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                Timestamp t = qs['time'];
                DateTime d = t.toDate();
                String nt = DateFormat('hh:mm a').format(d);
                // ignore: avoid_print
                print(d.toString());
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: name == qs['name']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: ListTile(
                          tileColor: const Color.fromARGB(255, 47, 47, 47),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          title: Text(
                            qs['name'],
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(0, 113, 227, 1)),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  qs['message'],
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text(nt)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
