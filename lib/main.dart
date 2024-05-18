import 'package:flutter/material.dart';
import 'package:uchef_app/screens/LogIn.dart'; // Import the HomeScreen.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UCHEF', // Corrected typo
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIn(), // Set HomeScreen as the home
    );
  }
}
