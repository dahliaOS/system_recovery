import 'package:flutter/material.dart';
import 'dart:io';

import 'oobeHome.dart';
import 'developerOptions.dart';

String getSystem() {
  ProcessResult result = Process.runSync('uname', ['-a']);
  var verString = result.stdout;
  return verString;
}

String processorName() {
  ProcessResult result = Process.runSync('neofetch', ['cpu']);
  //example result: cpu: Intel i7-3615QM (8) @ 2.30GHz
  var cpuString = result.stdout;
  return cpuString.replaceFirst("cpu: ", "");
}

String gpuNames() {
  ProcessResult result = Process.runSync('neofetch', ['gpu']);
  //example result: gpu: Intel HD Graphics 4000, NVIDIA GeForce GT 650M
  var gpuString = result.stdout;
  return gpuString.replaceAll("gpu: ", '');
}

String ram() {
  ProcessResult result = Process.runSync('neofetch', ['memory']);
  //example result: memory: 9212MiB / 16384MiB
  var ramString = result.stdout;
  return ramString.replaceFirst('memory: ', '');
}

void showPowerMenu(context) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 120),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          height: 90,
          width: 400,
          child: SizedBox.expand(
            child: new Center(
                child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, right: 20),
                  child: buildPowerItem(Icons.power_settings_new, 'Power off',
                      'shutdown', '-h now'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, right: 20),
                  child: buildPowerItem(Icons.refresh, 'Restart', 'reboot', ''),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, right: 20),
                  child: buildPowerItem(Icons.grid_3x3, 'Terminal',
                      'killall', 'pangolin_desktop'),
                ),
              ],
            )),
          ),
          margin: EdgeInsets.only(bottom: 75, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return FadeTransition(
        opacity: anim,
        child: child,
      );
    },
  );
}

class RecoveryPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.grey[900].withOpacity(0.0),
            body: Center(
                child: SizedBox(
                    width: 640.0,
                    height: 540.0,
                    child: ClipRRect(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(5.0)),
                      child:

                          /**/

                          new MyApp(),
                    ))),
            appBar: AppBar(
              backgroundColor: const Color(0x00ffffff),
              centerTitle: false,
              elevation: 0.0,
              title: Text(
                getSystem(),
                style: new TextStyle(
                  fontSize: 15.0,
                  color: const Color(0xFFffffff),
                  fontFamily: "Roboto",
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
              ),
            )));
  }
}

extension CustomColorScheme on ColorScheme {
  Color get foregroundText => brightness == Brightness.light
      ? Colors.grey[900]
      : const Color(0xFFffffff);

  Color get logoColor =>
      brightness == Brightness.light ? Colors.deepOrange : Colors.white;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'dahliaOS-setup',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.comfortable,
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
      ),
      themeMode: ThemeMode.light,
      darkTheme: new ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.comfortable,
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        toggleableActiveColor: Colors.deepOrange,
      ),
      home: new SecondRoute(),
    );
  }
}

MaterialButton buildPowerItem(
    IconData icon, String label, String function, String subARG) {
  return MaterialButton(
    onPressed: () {
      Process.run(
        function,
        [subARG],
      );
    },
    child: Column(
      //mainAxisSize: MainAxisSize.min,
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.grey[900],
          size: 25.0,
          semanticLabel: 'Power off',
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[900],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
