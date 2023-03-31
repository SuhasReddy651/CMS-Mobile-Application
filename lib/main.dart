import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProjectCMS());
}

class ProjectCMS extends StatelessWidget {
  const ProjectCMS({super.key});

  @override
  
  Widget build(BuildContext context) {
    
    return MaterialApp(
        title: "CMS Application",
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}