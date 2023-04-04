import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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

  Future<void> _selectFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // Navigate to the Preview page with the selected image
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Preview(imagePath: image!.path),
    ));
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
              width: MediaQuery.of(context).size.width * 0.5,
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
                onPressed: () async {
                  try {
                    // Capture the image
                    final image = await _cameraController.takePicture();

                    // Navigate to the Preview page with the captured image
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Preview(imagePath: image.path),
                    ));
                  } catch (e) {
                    // Handle any errors that occur while capturing the image
                    // ignore: avoid_print
                    print('Error capturing image: $e');
                  }
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

class Preview extends StatefulWidget {
  final String imagePath;

  const Preview({Key? key, required this.imagePath}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late String _responseMessage;

  Future<void> _sendImageForRecognition() async {
    try {
// encode the image file as base64 string
      // send POST request to Flask API for face recognition
      final headers = {"Content-Type": "multipart/form-data"};
      var request = http.MultipartRequest(
          "POST", Uri.parse("http://192.168.0.100:5000/face_recognition"));

      request.files.add(await http.MultipartFile.fromPath(
        'image',
        widget.imagePath,
      ));
      var response = await request.send();
      http.Response res = await http.Response.fromStream(response);
      final resJson = jsonDecode(res.body);
      return resJson;
    } catch (e) {
      _showErrorDialog(context);
    }
  }

  Future<void> _showResponseDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Face Recognition Result'),
          content: SingleChildScrollView(
            child: Text(_responseMessage),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showErrorDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const SingleChildScrollView(
            child: Text('Failed to send image for recognition.'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Preview Page',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          titleSpacing: MediaQuery.of(context).size.width * 0.15,
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.file(
              File(widget.imagePath),
              fit: BoxFit.contain,
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.1,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.15,
                right: MediaQuery.of(context).size.width * 0.15,
                top: MediaQuery.of(context).size.width * 0.05,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color.fromARGB(255, 13, 115, 217),
              ),
              child: TextButton(
                onPressed: () {
                  _sendImageForRecognition();
                },
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }
}
