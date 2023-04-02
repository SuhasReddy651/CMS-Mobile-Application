import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HelloCam extends StatefulWidget {
  const HelloCam({Key? key}) : super(key: key);

  @override
  _HelloCamState createState() => _HelloCamState();
}

class _HelloCamState extends State<HelloCam> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCameraControllerFuture();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeCameraControllerFuture() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    await _controller.initialize();
  }

  Future<XFile?> _takePicture() async {
    if (!_controller.value.isInitialized) {
      return null;
    }

    XFile file = await _controller.takePicture();
    return file;
  }

  Future<Object> _sendImage(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://139.59.62.113:5000/face_recognition'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      return json.decode(responseString);
    } else {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                XFile? imageFile = await _takePicture();
                if (imageFile != null) {
                  File image = File(imageFile.path);
                  Object response = await _sendImage(image);
                  Map<String, dynamic> jsonResponse =
                      response as Map<String, dynamic>;
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('API Response'),
                        content: Text(jsonResponse as String),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Take Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
