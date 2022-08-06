import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recovery/pages/wirelessConnection.dart';
import 'dart:io';
import 'recovery.dart';
import 'diskSelection.dart';
import 'alertConfirm.dart';
import '../widgets/formAlert.dart';

Widget hardWaresupported() {
  if (gpuNames().toLowerCase().contains('amd') == false &&
          processorName().toLowerCase().contains('intel') ||
      gpuNames().toLowerCase().contains('intel') ||
      gpuNames().toLowerCase().contains('nvidia')) {
    return formAlert(Colors.green, "This computer can run dahliaOS comfortably",
        Color(0xFFffffff), Icons.check_circle_outline);
  } else if (processorName().toLowerCase().contains('amd') ||
      gpuNames().toLowerCase().contains('amd')) {
    return formAlert(
        Colors.red,
        "dahliaOS will not run well on this machine. Performance may be degraded.",
        Color(0xFFffffff),
        Icons.error_outline);
  } else {
    return formAlert(
        Colors.amber,
        "This hardware is not recognized. You may encounter instability.",
        Color(0xFF222222),
        Icons.warning);
  }
}

class HardwareSummary extends StatefulWidget {
  @override
  _HardwareSummaryState createState() => _HardwareSummaryState();
}

class _HardwareSummaryState extends State<HardwareSummary> {
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
                    Icons.memory,
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
              child: Text('Hardware Compatibility',
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
                  hardWaresupported(),
                  Container(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/cpu.png',
                            height: 128,
                          ),
                          Container(
                            width: 128,
                            child: Text(processorName()),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/gpu.png',
                            height: 128,
                          ),
                          Container(
                            width: 256,
                            child: Text(gpuNames().replaceAll(', ', '\n')),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'lib/assets/ram.png',
                            height: 128,
                          ),
                          Container(
                              width: 128,
                              child: Text(
                                  ram().split(' / ')[1].replaceAll('M', ' M')))
                        ],
                      )
                    ],
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WirelessConnection()),
                              );
                            },
                            child: Text('Continue'))),
                  ],
                )
              ]))
        ]));
  }
}
