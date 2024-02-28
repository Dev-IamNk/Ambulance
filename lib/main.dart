import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trafficassister/backend/auth.dart';
import 'package:trafficassister/pages/home.dart';
import 'package:trafficassister/pages/login.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: FirebaseOptions
          (
            apiKey: "AIzaSyA8YWb9VUSfa4-itDvrZHnUOlDhvQJvipo",
            appId: "1:145316764675:android:aa50fc518bb0d4edb38236",
            messagingSenderId: "145316764675",
            projectId: "ambulance-93dbd"
        )
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return MaterialApp(
              home: HomePage(),
              debugShowCheckedModeBanner: false,
            );
          }
          else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginScreen(),
            );
          }
        }
    );
  }
}

