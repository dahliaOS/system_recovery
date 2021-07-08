import 'package:flutter/material.dart';
import 'package:recovery/pages/hardwareSumary.dart';
import 'dart:io';
import 'recovery.dart';
import 'developerOptions.dart';
import 'enterpriseEnrollment.dart';
import 'tryLoader.dart';
import 'wirelessConnection.dart';

void darkmode() {}

class SecondRoute extends StatelessWidget {
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
                    Icons.brightness_low,
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
              padding: EdgeInsets.only(left: 25),
              child: Text('Welcome to dahliaOS!',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.foregroundText,
                  ))),
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
                  ListTile(
                    leading: Icon(Icons.launch),
                    title: Text('Try dahliaOS'),
                    subtitle: Text('Test drive dahliaOS without installing'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TryLoader()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.save_alt),
                    title: Text('Install dahliaOS'),
                    subtitle:
                        Text('Configure and install dahliaOS to this computer'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HardwareSummary()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.construction),
                    title: Text('Repair dahliaOS'),
                    subtitle: Text('Repair and recover data'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // do something
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.business),
                    title: Text('Enterprise Enrollment'),
                    subtitle: Text(
                        'Automatically configure dahliaOS for use with an organization'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterpriseEnrollment()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.developer_board),
                    title: Text('Developer Mode'),
                    subtitle: Text('Enable advanced debugging features'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeveloperMode()),
                      );
                    },
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
                /*Padding(
                  padding: EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                  child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.language),
                      label: Text("English (US)")),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 1.0,
                        color: Colors.deepOrange[500],
                        child: Text('Back')))*/
              ]))
        ]));
  }
}
