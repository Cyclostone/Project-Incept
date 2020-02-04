import 'package:flutter/material.dart';
import 'package:incept_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Project Incept",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: Homepage(),
    );
  }
}