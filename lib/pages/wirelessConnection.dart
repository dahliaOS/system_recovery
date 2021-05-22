import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'recovery.dart';
import 'diskSelection.dart';
import 'alertConfirm.dart';
import '../widgets/formAlert.dart';

class WirelessConnection extends StatefulWidget {
  @override
  _WirelessConnectionState createState() => _WirelessConnectionState();
}

class _WirelessConnectionState extends State<WirelessConnection> {
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
                    Icons.wifi,
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
              child: Text('Network Connection',
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
                      'For the best experience, connect to a network before installing dahliaOS.'),
                  Container(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_ethernet),
                    title: Text('Ethernet'),
                    subtitle: Text('Not connected'),
                    trailing: Icon(Icons.add),
                  ),
                  ListTile(
                    leading: Icon(Icons.signal_wifi_4_bar_lock),
                    title: Text('Pixel 2 XL'),
                    subtitle: Text(
                      'Connected',
                      style: TextStyle(color: Colors.green[700]),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.signal_wifi_4_bar),
                    title: Text('NETGEAR41'),
                    //subtitle: Text('Allows modifications to the base system'),
                  ),
                  ListTile(
                    leading: Icon(Icons.signal_wifi_0_bar),
                    title: Text('SMA1990120165'),
                    //subtitle: Text('Allows potentially insecure unsigned code to run on the base system'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.wifi_tethering),
                    title: Text('Add other WiFi network'),
                    //subtitle: Text('Allows potentially insecure unsigned code to run on the base system'),
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
                        child: OutlinedButton(
                            onPressed: () {
                              bool popContext;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    title: Text("Skip network setup?"),
                                    content: Text(
                                        "Without a network connection, dahliaOS will not be able to fetch the latest updates, install packages, or sync enrollment profiles."),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DiskSelection()),
                                          );
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Skip'))),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiskSelection()),
                              );
                            },
                            child: Text('Continue'))),
                  ],
                )
              ]))
        ]));
  }
}
