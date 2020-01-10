import 'package:flutter/material.dart';
import 'package:recovery/recovery.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

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
      return new RecoveryApp();
      
    }
}