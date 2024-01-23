import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_app/screens/list_pages.dart';
import 'package:movie_app/screens/signin_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCsHDQtI9DItQgSqwy45_y2xG9tDGxuER8",
        appId: "1:540215271818:web:8b22d4aee01acdce862873",
        messagingSenderId: "540215271818",
        projectId: "flutter-firebase-9c136",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MovieProject());
}

class MovieProject extends StatelessWidget{
  const MovieProject({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: const SignInScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
        primaryColor:Colors.green),
    );
  }
}


