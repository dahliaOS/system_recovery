import 'package:flutter/material.dart';
import 'package:recovery/pages/recovery.dart';
import 'dart:io';

void main() {
  getSystem();

  runApp(new RecoveryApp());
}

class RecoveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Recovery Mode',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new recovery(),
    );
  }
}

class recovery extends StatefulWidget {
  recovery({Key key}) : super(key: key);
  @override
  _recoveryState createState() => new _recoveryState();
}

class _recoveryState extends State<recovery> {
  @override
  Widget build(BuildContext context) {
    return new RecoveryPage();
  }
}
