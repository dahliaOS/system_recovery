import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'recovery.dart';
import '../widgets/diskWidget.dart';

import 'alertConfirm.dart';
import '../widgets/formAlert.dart';

class DiskSelection extends StatefulWidget {
  @override
  _DiskSelectionState createState() => _DiskSelectionState();
}

class _DiskSelectionState extends State<DiskSelection> {
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
                    Icons.save_alt,
                    size: 32,
                    color: Colors.deepOrange,
                  ),
                  IconButton(
                      onPressed: () {
                        showPowerMenu(context);
                      },
                      icon: Icon(Icons.power_settings_new))
                ],
              ) //Image.asset('lib/logo-color.png',width: 165.0, height: 32.0, fit: BoxFit.fill)
              ),
          Padding(
              padding: EdgeInsets.only(left: 25, bottom: 15),
              child: Text('Install dahliaOS',
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                      color: Colors.grey[900]))),
          Expanded(
            child: Center(
                child: Container(
              height: 350,
              margin: EdgeInsets.only(left: 25, right: 25),
              child: ListView(
                children: <Widget>[
                  Text(
                      'Select a drive to install dahliaOS on. An 8GiB or larger drive is recommended.'),
                  Container(
                    height: 10,
                  ),
                  selectableDisk(),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.wifi_tethering),
                    title: Text('Add other WiFi network'),
                    //subtitle: Text('Allows potentially insecure unsigned code to run on the base system'),
                  ),
                  formAlert(
                      Colors.amber,
                      "Warning: dahliaOS can't be dual booted yet.",
                      Color(0xFF222222),
                      Icons.warning),
                ],
              ),
            )),
          ),
          Align(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 15),
                  child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 16,
                      ),
                      label: Text("Back")),
                ),
                Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Install'))),
                  ],
                )
              ]))
        ]));
  }
}
