import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'recovery.dart';
import '../devFlags.dart';
import 'alertConfirm.dart';
import '../widgets/formAlert.dart';

class DeveloperMode extends StatefulWidget {
  @override
  _DeveloperModeState createState() => _DeveloperModeState();
}

class _DeveloperModeState extends State<DeveloperMode> {
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
                    Icons.developer_board,
                    size: 32,
                    color: Colors.deepOrange,
                  ),
                  IconButton(
                      onPressed: () {
                        showPowerMenu(context);
                      },
                      tooltip: "Power Options",
                      icon: Icon(Icons.power_settings_new))
                ],
              ) //Image.asset('lib/logo-color.png',width: 165.0, height: 32.0, fit: BoxFit.fill)
              ),
          Padding(
              padding: EdgeInsets.only(left: 25, bottom: 15),
              child: Text('Developer Mode',
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                      color: Colors.grey[900]))),
          /*Center(
            child: Padding(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 0.0, bottom: 35.0),
                child: Text('txt',
                    style: TextStyle(
                        color: Color(4278190080),
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal))),
          ),*/
          Expanded(
            child: Center(
                child: Container(
              height: 350,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: <Widget>[
                  formAlert(
                      Colors.red,
                      "DANGER! Developer Mode can compromise your device\'s security or erase data!",
                      Colors.white,
                      Icons.dangerous),
                  Container(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(Icons.code),
                    title: Text('Enable Developer Mode'),
                    subtitle: Text('Activate advanced debugging features'),
                    trailing: Switch(
                      value: enableDeveloperMode,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            alertConfirm(
                                "Developer mode can be dangerous!",
                                "Enabling developer options can expose your device to security vulnerabilities, and may lead to a loss of data!",
                                context);
                          }
                          enableDeveloperMode = value;
                        });
                      },
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.developer_mode),
                    title: Text('VT2 Shell Access'),
                    subtitle:
                        Text('Provides access to a shell using CTRL+ALT+F2'),
                    trailing: Checkbox(
                      value: vt2enabled,
                      onChanged: enableDeveloperMode
                          ? (value) {
                              setState(() {
                                vt2enabled = value;
                              });
                            }
                          : null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.app_registration),
                    title: Text('Mount RootFS as read/write'),
                    subtitle: Text('Allows modifications to the base system'),
                    trailing: Checkbox(
                      value: rwRootfs,
                      onChanged: enableDeveloperMode
                          ? (value) {
                              setState(() {
                                rwRootfs = value;
                              });
                            }
                          : null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.remove_moderator),
                    title: Text('Disable Software Verification'),
                    subtitle: Text(
                        'Allows potentially insecure unsigned code to run on the base system'),
                    trailing: Checkbox(
                      value: softwareValidation,
                      onChanged: enableDeveloperMode
                          ? (value) {
                              setState(() {
                                softwareValidation = value;
                              });
                            }
                          : null,
                    ),
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
