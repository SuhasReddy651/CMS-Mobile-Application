import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int _cameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
    );
    await _controller.initialize();
  }

  Future<String> _submitImage(File imageFile) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://139.59.62.113:5000/'),
    );
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseBody);
      return responseJson['names'];
    } else {
      throw Exception('Failed to recognize faces');
    }
  }

  void _takePicture(BuildContext context) async {
    try {
      await _initializeControllerFuture;
      final imageFile = await _controller.takePicture();
      final result = await _submitImage(imageFile.path as File);
      Navigator.of(context).pop(result);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to recognize faces')),
      );
    }
  }

  void _toggleCamera() {
    setState(() {
      _cameraIndex = (_cameraIndex + 1) % 2;
      _initializeCamera();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Click the Picture',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
        ),
      )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.75,
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ClipRect(
                child: OverflowBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SizedBox(
                      height: _controller.value.previewSize!.height,
                      width: _controller.value.previewSize!.width,
                      child: CameraPreview(_controller),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _takePicture(context),
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _toggleCamera,
            child: const Icon(Icons.flip_camera_android),
          ),
        ],
      ),
    );
  }
}
