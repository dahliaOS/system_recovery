import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'recovery.dart';
import '../widgets/diskWidget.dart';

import 'alertConfirm.dart';
import '../widgets/formAlert.dart';

class AccountSetup extends StatefulWidget {
  @override
  _AccountSetupState createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
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
                    Icons.person_add,
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
              child: Text('Accounts',
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      selectableDisk(),
                    ],
                  ),
                  Container(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          tooltip: "Detect disks",
                          icon: Icon(Icons.refresh)),
                      Text(
                        "Selected /dev/sda (SDSSDH3512G)",
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  Container(
                    height: 16,
                  ),
                  formAlert(
                      Colors.amber,
                      "Warning: dahliaOS can't be dual booted yet. The entire disk will be erased.",
                      Color(0xFF222222),
                      Icons.warning),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.cloud_done),
                    title: Text('Remote Home Folder'),
                    subtitle: Text("Store files on a remote network device"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
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
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title: Text(
                                        "Erase disk and install dahliaOS?"),
                                    content: Text(
                                        "All data on the disk /dev/sda will be erased. This action cannot be undone. Do you want to continue?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("CANCEL"),
                                      ),
                                      // usually buttons at the bottom of the dialog
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("ERASE DISK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Install'))),
                  ],
                )
              ]))
        ]));
  }
}
