import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isConnectedToInternet = false;

  StreamSubscription? _internetConnectionStreamSubscription;

  @override
  void initState() {
     super.initState();
    _internetConnectionStreamSubscription =InternetConnection().onStatusChange.listen((event){
     // print(event);
      switch (event) {
        case InternetStatus.connected:
        setState(() {
          isConnectedToInternet =true;
       });
          break;
           case InternetStatus.disconnected:
           setState(() {
          isConnectedToInternet =false;
       });
          break;
        default:
       setState(() {
          isConnectedToInternet =false;
       });
        break;
      }
    });
  }

  @override
  void dispose() {
   _internetConnectionStreamSubscription ?.cancel();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Network Testing App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isConnectedToInternet ? "Connected" : "Disconnected",
            style:const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}