import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'recovery.dart';
import '../widgets/diskWidget.dart';
import 'accountSetup.dart';
import 'alertConfirm.dart';
import '../widgets/formAlert.dart';

class DiskSelection extends StatefulWidget {
  @override
  _DiskSelectionState createState() => _DiskSelectionState();
}

enum SystemDisks { sda, sdb, mmcblk0 }

class _DiskSelectionState extends State<DiskSelection> {
  SystemDisks _disks = SystemDisks.sda;
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
                    fontWeight: FontWeight.w300,
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
                  Text(
                      'Select a drive to install dahliaOS on. An 8GiB or larger drive is recommended.'),
                  Container(
                    height: 10,
                  ),
                  //Disks list
                  ListTile(
                    leading: Image.asset(
                      "lib/drive-harddisk.png",
                      height: 35,
                    ),
                    title: Text('SDSSDH3512G'),
                    subtitle: Text("/dev/sda - 500 GiB"),
                    trailing: Radio(
                      value: SystemDisks.sda,
                      groupValue: _disks,
                      onChanged: (SystemDisks value) {
                        setState(() {
                          _disks = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "lib/media-memory.png",
                      height: 35,
                    ),
                    title: Text('Macintosh SSD'),
                    subtitle: Text("/dev/sdb - 512 GiB"),
                    trailing: Radio(
                      value: SystemDisks.sdb,
                      groupValue: _disks,
                      onChanged: (SystemDisks value) {
                        setState(() {
                          _disks = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "lib/media-flash.png",
                      height: 35,
                    ),
                    title: Text('Apple SD Card Reader'),
                    subtitle: Text("/dev/mmcblk0 - 16 GiB"),
                    trailing: Radio(
                      value: SystemDisks.mmcblk0,
                      groupValue: _disks,
                      onChanged: (SystemDisks value) {
                        setState(() {
                          _disks = value;
                        });
                      },
                    ),
                  ),
                  //end of disks section
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
