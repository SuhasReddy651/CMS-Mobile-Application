import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:project/screens/attendance/staff_camera.dart';

class SelfButtonPage extends StatefulWidget {
  const SelfButtonPage({Key? key}) : super(key: key);

  @override
  _SelfButtonPageState createState() => _SelfButtonPageState();
}

class _SelfButtonPageState extends State<SelfButtonPage> {
  final _dateFormat = DateFormat('yyyy-MM-dd');
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Self Attendance Page',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width * 0.15,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Rules for Marking Attendance',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '- You need to be within 200 meters readius of the Institution.',
                    style: TextStyle(fontFamily: 'Courier', letterSpacing: 0.1),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '- No attendance history for the day.',
                    style: TextStyle(fontFamily: 'Courier', letterSpacing: 0.1),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(35),
                  backgroundColor: const Color.fromARGB(255, 13, 115, 217),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)))),
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });

                      // Check location
                      final position = await _getCurrentPosition();
                      final instituteLocation = await _getInstituteLocation();
                      final distance = Geolocator.distanceBetween(
                          position.latitude,
                          position.longitude,
                          instituteLocation.latitude,
                          instituteLocation.longitude);
                      if (distance > 200) {
                        String dis = distance as String;
                        _showError('Be in the location');
                        setState(() {
                          _isLoading = false;
                        });
                        return;
                      }

                      // Check attendance
                      final currentUserAttendanceRef = FirebaseFirestore
                          .instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .collection('attendance')
                          .doc(_dateFormat.format(DateTime.now()));
                      final currentUserAttendanceSnapshot =
                          await currentUserAttendanceRef.get();
                      if (currentUserAttendanceSnapshot.exists) {
                        _showError('Already marked');
                        setState(() {
                          _isLoading = false;
                        });
                        return;
                      }

                      // Navigate to camera page
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const StaffAttCamera(),
                      ));

                      setState(() {
                        _isLoading = false;
                      });
                    },
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Self Attendance'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _getCurrentPosition() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      _showError('Location permission denied');
      throw Exception('Location permission denied');
    }

    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  Future<Position> _getInstituteLocation() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('locations')
        .doc('college')
        .get();
    final location = snapshot['location'];
    return Position(
        latitude: location.latitude,
        longitude: location.longitude,
        accuracy: 100,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        timestamp: null);
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
