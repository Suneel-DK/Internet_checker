import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/connectpage.dart';
import 'package:flutter_application_1/screens/disconnectpage.dart';
import 'package:flutter_application_1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,

      home: const HomePage(),
      routes: {
        'connect': (context)=> const Connectpage(),
        'disconnect': (context)=> const DisconnectPage(),
      },
    );
  }
}


