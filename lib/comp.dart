import 'package:flutter/material.dart';
import 'decodejson.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(Home1());

class Home1 extends StatefulWidget {
  static const platform = const MethodChannel('ondeviceML');
  
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  TextEditingController texts = new TextEditingController();
  List<int> inp = List();
  bool offensive = false;
  Color offensive_color = Colors.black;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}