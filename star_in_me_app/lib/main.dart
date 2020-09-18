import 'package:flutter/material.dart';
import 'home.dart';
import 'onboarding/UI1.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Star in Me",
        debugShowCheckedModeBanner: false,

        home: UI1(),
    );
  }
}