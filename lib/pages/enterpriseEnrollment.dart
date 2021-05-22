import 'package:flutter/material.dart';
import 'dart:io';
import 'recovery.dart';
import '../widgets/formAlert.dart';

class EnterpriseEnrollment extends StatefulWidget {
  @override
  _EnterpriseEnrollmentState createState() => _EnterpriseEnrollmentState();
}

class _EnterpriseEnrollmentState extends State<EnterpriseEnrollment> {
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
                    Icons.business,
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
              padding: EdgeInsets.only(
                left: 25,
              ),
              child: Text('Enterprise Enrollment',
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
                  Container(
                    height: 15,
                  ),
                  Text(
                      "Enter an enterprise URL and a public key to configure dahliaOS for use with an organization. For more information, see docs.dahliaos.io/enterprise/enrollment"),
                  Container(
                    height: 25,
                  ),
                  formAlert(
                      Colors.lightBlue,
                      'This device is already enrolled with the organization "dahliaOS"',
                      Color(0xFFffffff),
                      Icons.info_outline),
                  Container(
                    height: 25,
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: "https://dahliaOS.io",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Organization URL'),
                  ),
                  Container(
                    height: 25,
                  ),
                  TextFormField(
                    enabled: false,
                    initialValue: 'NaN',
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enrollment Key'),
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
