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
        apiKey: "AIzaSyAAFYDjI0l1bA4AL_WB-bpZmg-cHv6KXww",
        appId: "1:707031315192:android:8846f1378758812cf9010d",
        messagingSenderId: "707031315192",
        projectId: "fir-flutter-auth-d0aa5",
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


