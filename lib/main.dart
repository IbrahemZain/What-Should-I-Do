import 'package:flutter/material.dart';
import 'create_spinning.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'What Should I Do',
            style: TextStyle(fontFamily: 'Oswald'),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: CreateSpinning(),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}