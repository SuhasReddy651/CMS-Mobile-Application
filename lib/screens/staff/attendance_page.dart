import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SelfAttendancePage extends StatefulWidget {
  final String userId;

  SelfAttendancePage({required this.userId});

  @override
  _SelfAttendancePageState createState() => _SelfAttendancePageState();
}

class _SelfAttendancePageState extends State<SelfAttendancePage> {
  final _picker = ImagePicker();
  final _firestore = FirebaseFirestore.instance;
  Position? _userLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Show an error message or prompt the user to enable location services
      print('Location services are disabled.');
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Ask the user for permission to access location
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Show an error message or prompt the user to grant location permissions
        print('Location permissions are denied.');
        return;
      }
    }

    // Get the user's current position
    _userLocation = await Geolocator.getCurrentPosition();
  }

  Future<void> _getUserAttendance() async {
    final currentDate = DateTime.now().toLocal().toString().split(' ')[0];
    final attendanceRef = _firestore
        .collection('users')
        .doc(widget.userId)
        .collection('attendance')
        .doc(currentDate);
    final attendanceDoc = await attendanceRef.get();
    if (attendanceDoc.exists) {
      // attendance already taken for the day
      return;
    }
    // attendance not taken for the day, proceed to get location
    final userLocation = await _getLocation();
    final distance = await _getDistanceFromInstitute(userLocation);
    if (distance < 200) {
      // user is at the institute, proceed to take picture and mark attendance
      final picture = await _takePicture();
      final result = await _sendPictureToFlaskApi(picture);
      if (result == 'present') {
        await attendanceRef.set({'timestamp': FieldValue.serverTimestamp()});
      }
    }
  }

  Future<Position> _getLocation() async {
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _userLocation = position;
    });
    return position;
  }

  Future<double> _getDistanceFromInstitute(Position userLocation) async {
    final instituteLocationDoc =
        await _firestore.collection('locations').doc('institute').get();
    final instituteLocation = instituteLocationDoc.data();
    final distance = Geolocator.distanceBetween(
        userLocation.latitude,
        userLocation.longitude,
        instituteLocation!['latitude'],
        instituteLocation['longitude']);
    return distance;
  }

  Future<XFile?> _takePicture() async {
    final picture = await _picker.pickImage(source: ImageSource.camera);
    return picture;
  }

  Future<String> _sendPictureToFlaskApi(XFile? picture) async {
    final bytes = await picture!.readAsBytes();
    final response =
        await http.post(Uri.parse('http://139.59.62.113:5000/'), body: bytes);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _getUserAttendance,
          child: const Text('Mark Attendance'),
        ),
      ),
    );
  }
}
