import 'package:flutter/material.dart';
import 'dart:io';

List drives;

List devDrives() {
  //todo: make sure size is read eventually to prevent confusion
  var disks =
      Process.runSync('bash', ['disks1.sh']).stdout.toString().split('\n');
  return (disks);
}

List driveInfo() {
  var labels =
      Process.runSync('bash', ['disks2.sh']).stdout.toString().split('\n');
  return (labels);
}

List diskTiles(List drives, List info) {
  List diskwidgets;
  diskwidgets.add(
    Text(
        'Select a drive to install dahliaOS on. An 8GiB or larger drive is recommended.'),
  );
  diskwidgets.add(
    Container(
      height: 10,
    ),
  );
  drives.forEach((network) {
    print(network.position);
  });
  return diskwidgets;
}
