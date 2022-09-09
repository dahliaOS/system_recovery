import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recovery/buildInfo.dart';
import 'package:recovery/pages/installFlow.dart';
import 'dart:io';
import 'recovery.dart';
import '../widgets/diskWidget.dart';
import 'accountSetup.dart';
import 'alertConfirm.dart';
import '../widgets/formAlert.dart';
import '../disk_info.dart';

class DiskSelection extends StatefulWidget {
  @override
  _DiskSelectionState createState() => _DiskSelectionState();
}

class _DiskSelectionState extends State<DiskSelection> {
  List<Widget> diskTiles(List drives) {
    List<Widget> diskwidgets = [
      Text(
          'Select a drive to install dahliaOS on. An 8G or larger drive is recommended.'),
      Container(
        height: 10,
      ),
      formAlert(
          Colors.amber,
          "dahliaOS can't be dual booted. The entire disk will be erased.",
          Color(0xFF222222),
          Icons.warning),
      Container(
        height: 10,
      ),
    ];

    drives.forEach((drive) {
      diskwidgets.add(ListTile(
          leading: Image.asset(
            "lib/drive-harddisk.png",
            height: 35,
          ),
          title: Text(infoDrives(drive)),
          subtitle: Text("/dev/" + drive + " - " + sizeDrives(drive)),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DiskConfirmation(
                        disk: drive,
                      )),
            );
          }));
    });
    return diskwidgets;
  }

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
                      tooltip: "Power Options",
                      icon: Icon(Icons.power_settings_new))
                ],
              ) //Image.asset('lib/logo-color.png',width: 165.0, height: 32.0, fit: BoxFit.fill)
              ),
          Padding(
              padding: EdgeInsets.only(left: 25, bottom: 15),
              child: Text('Install dahliaOS',
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
              child: ListView(children: diskTiles(devDrives())),
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
                /* Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiskConfirmation()),
                              );
                            },
                            child: Text('Install'))),
                  ],
                )*/
              ]))
        ]));
  }
}

class DiskConfirmation extends StatefulWidget {
  final String disk;
  final String model;
  final String size;
  const DiskConfirmation(
      {Key key, String this.disk, String this.model, String this.size})
      : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() =>
      new _DiskConfirmationState(disk, model, size);
}

class _DiskConfirmationState extends State<DiskConfirmation> {
  bool install = false;

  String disk;
  String model;
  String size;

  _DiskConfirmationState(String disk, String model, String size) {
    this.disk = disk;
    this.model = model;
    this.size = size;
  }
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
                    Icons.done_all,
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
              child: Text('Installation Summary',
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
                  formAlert(Colors.red, "The entire disk will be erased.",
                      Color(0xFFffffff), Icons.dangerous),
                  Container(
                    height: 16,
                  ),
                  Text('dahliaOS will be installed on the following disk:'),
                  Container(height: 16),
                  ListTile(
                    leading: Image.asset(
                      "lib/drive-harddisk.png",
                      height: 35,
                    ),
                    title: Text(infoDrives(disk)),
                    subtitle: Text("/dev/" + disk + " - " + sizeDrives(disk)),
                    trailing: Icon(Icons.check),
                  ),
                  Container(
                    height: 16,
                  ),
                  Text(
                      "This will erase all data on the disk. Are you sure you want to continue?"),
                  Container(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: this.install,
                        onChanged: (bool value) {
                          setState(() {
                            this.install = value;
                          });
                        },
                      ),
                      Text("These changes are correct"),
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
                            onPressed: install
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InstallFlow(
                                                disk: disk,
                                              )),
                                    );
                                  }
                                : null,
                            child: Text('Install'))),
                  ],
                )
              ]))
        ]));
  }
}
