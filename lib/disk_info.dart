import 'package:flutter/material.dart';
import 'dart:io';
import 'widgets/formAlert.dart';

List devDrives() {
  var disks =
      Process.runSync('sh', ['listDisks.sh']).stdout.toString().split('\n');
  disks.removeWhere((element) => element == '');
  return (disks);
}

String getSystem() {
  ProcessResult result = Process.runSync('uname', ['-a']);
  var verString = result.stdout;
  return verString;
}

String sizeDrives(String mountPoint) {
  ProcessResult result =
      Process.runSync('sh', ['diskSize.sh', '/dev/' + mountPoint]);
  var size = result.stdout;
  return size.toString().replaceAll('\n', '');
}

String infoDrives(String mountPoint) {
  ProcessResult result =
      Process.runSync('sh', ['diskModel.sh', '/dev/' + mountPoint]);
  var info = result.stdout;
  return info.toString().replaceAll('\n', '');
}
