import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StudentAttendanceState createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller and get a list of available cameras
    availableCameras().then((value) {
      _cameras = value;

      if (_cameras.isNotEmpty) {
        _cameraController =
            CameraController(_cameras[0], ResolutionPreset.high);
        _cameraController.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameras == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_cameras.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Student Attendance'),
          backgroundColor: Colors.black,
        ),
        body: const Center(
          child: Text('No cameras available'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Attendance',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        titleSpacing: MediaQuery.of(context).size.width * 0.05,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Click the picture of each row seperately',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.85 * (16 / 9),
              child: _cameraController.value.isInitialized
                  ? CameraPreview(_cameraController)
                  : const SizedBox(),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.2,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color.fromARGB(255, 13, 115, 217)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Click Picture',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



