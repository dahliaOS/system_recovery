import 'package:flutter/material.dart';
import 'dart:io';
import 'recovery.dart';
import '../widgets/formAlert.dart';

class InstallFlow extends StatefulWidget {
  final String disk;
  const InstallFlow({Key key, String this.disk})
      : super(
          key: key,
        );
  @override
  _InstallFlowState createState() => _InstallFlowState();
}

class _InstallFlowState extends State<InstallFlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.install_desktop,
                    size: 32,
                    color: Colors.deepOrange,
                  ),
                  IconButton(
                      tooltip:
                          "The system can't be shut down while installation is in progress.",
                      icon: Icon(Icons.power_settings_new))
                ],
              ) //Image.asset('lib/logo-color.png',width: 165.0, height: 32.0, fit: BoxFit.fill)
              ),
          Padding(
              padding: EdgeInsets.only(
                left: 25,
              ),
              child: Text('Installing dahliaOS',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.foregroundText,
                  ))),
          Expanded(
            child: Center(
                child: Container(
              height: 350,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 50,
                  ),
                  Text("/dev/" + widget.disk + ": Installing dahliaOS"),
                  Container(
                    height: 15,
                  ),
                  LinearProgressIndicator(
                    value: null,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ],
              ),
            )),
          ),
          Align(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'))),
              ]))
        ]));
  }
}
