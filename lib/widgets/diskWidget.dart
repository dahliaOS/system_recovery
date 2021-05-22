//diskWidget.dart
import 'package:flutter/material.dart';

Widget selectableDisk() {
  return Container(
    padding: EdgeInsets.only(right: 16),
    child: Center(
      child: Column(
        children: [
          Text("10 GiB"),
          Image.asset(
            "lib/drive-harddisk.png",
            height: 50,
          ),
          Text("SDSSDH3512G"),
          Text("/dev/sda")
        ],
      ),
    ),
  );
}
