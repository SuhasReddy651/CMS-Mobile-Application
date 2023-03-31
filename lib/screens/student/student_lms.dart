import 'package:flutter/material.dart';

class LMSDash extends StatefulWidget {
  const LMSDash({super.key});

  @override
  State<LMSDash> createState() => _LMSDashState();
}

class _LMSDashState extends State<LMSDash> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LMS Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: const Text(
                          "Your Courses",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: height / 1.7,
                        width: width / 1.1,
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color.fromARGB(255, 55, 55, 55),
                        ),
                      )
                    ],
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
