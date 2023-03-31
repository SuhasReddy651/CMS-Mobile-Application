import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class StaffAttCamera extends StatefulWidget {
  const StaffAttCamera({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StaffAttCameraState createState() => _StaffAttCameraState();
}

class _StaffAttCameraState extends State<StaffAttCamera> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller and get a list of available cameras
    availableCameras().then((value) {
      _cameras = value;

      if (_cameras.isNotEmpty) {
        // Use the front camera only
        _cameraController = CameraController(
            _cameras.firstWhere(
                (camera) => camera.lensDirection == CameraLensDirection.front),
            ResolutionPreset.high);
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
          title: const Text('Self Attendance'),
          backgroundColor: Colors.black,
          titleSpacing: MediaQuery.of(context).size.width * 0.1,
        ),
        body: const Center(
          child: Text('No cameras available'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Self Attendance',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        titleSpacing: MediaQuery.of(context).size.width * 0.1,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Position yourself in the center',
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
