import 'package:flutter/material.dart';
import 'dart:io';

String getSystem() {
  ProcessResult result = Process.runSync('uname', ['-a']);
  var verString = result.stdout;
  return verString;
}

class RecoveryPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
            child: SizedBox(
                width: 620.0,
                height: 480.0,
                child: ClipRRect(
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
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
                  fontFamily: "Roboto"),
            )));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new FirstRoute(),
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

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/sys-banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 35.0, bottom: 15.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Welcome to dahliaOS!',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w300,
                                fontSize: 30,
                                color: Colors.grey[900])),
                      ],
                    ),
                  )),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 10.0, bottom: 25.0),
                  child: Text(
                      'Welcome to the dahliaOS Alpha! You are currently using dahliaOS Linux-Based 200715.1. This system may be unstable, and is for testing only. If you run into any issues, please report them to the development team on Github, Twitter, or Discord.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal))),
            ),
            Align(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0.0, right: 20, bottom: 15),
                      child: OutlineButton(
                          onPressed: () {
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 20.0, right: 20),
                                            child: buildPowerItem(
                                                Icons.power_settings_new,
                                                'Power off',
                                                'shutdown',
                                                '-h now'),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 20.0, right: 20),
                                            child: buildPowerItem(Icons.refresh,
                                                'Restart', 'reboot', ''),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 20.0, right: 20),
                                            child: buildPowerItem(
                                                Icons.developer_mode,
                                                'Terminal',
                                                'killall',
                                                'pangolin_desktop'),
                                          ),
                                        ],
                                      )),
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 75, left: 12, right: 12),
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
                          },
                          color: Colors.deepOrange[500],
                          child: Text('Reboot'))),
                  Padding(
                      padding: EdgeInsets.only(top: 00.0, bottom: 15),
                      child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          },
                          elevation: 1.0,
                          color: Colors.deepOrange[500],
                          child: Text("Let's go"))),
                ])),
            Expanded(
              child: new Container(),
            ),
          ]),
    ));
  }
}

MaterialButton shellItem(
    IconData icon, String shellName, BuildContext context) {
  return new MaterialButton(
    onPressed: null,
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.grey[900],
          size: 25.0,
          semanticLabel: 'Power off',
        ),
        Container(
          margin: EdgeInsets.all(4),
          child: Text(
            shellName,
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
              padding: EdgeInsets.all(15.0),
              child: Image.asset('lib/logo-color.png',
                  width: 165.0, height: 32.0, fit: BoxFit.fill)),
          Center(
            child: Padding(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 0.0, bottom: 35.0),
                child: Text(
                    'To begin using dahliaOS, select a user shell below. Some shells are unfinished and may be unstable. If an error occurs, hold down the power button for 5-10 seconds until the device powers off.',
                    style: TextStyle(
                        color: Color(4278190080),
                        fontSize: 15.0,
                        fontStyle: FontStyle.normal))),
          ),
          Expanded(
            child: Center(
                child: Container(
                    color: Color(0xffeeeeee),
                    margin: EdgeInsets.all(10),
                    child: new SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: new Column(children: [
                          shellItem(Icons.brightness_low, 'Pangolin Desktop',
                              context),
                          shellItem(
                              Icons.error_outline, 'Kernel Panic', context),
                          shellItem(
                              Icons.sync_problem, 'Recovery Mode', context),
                          shellItem(Icons.lock, 'Lock Screen', context),
                          shellItem(Icons.developer_mode,
                              'Command Line Interface', context),
                        ])))),
          ),
          Align(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                    child: OutlineButton(
                        onPressed: () {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0, right: 20),
                                          child: buildPowerItem(
                                              Icons.power_settings_new,
                                              'Power off',
                                              'shutdown',
                                              '-h now'),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0, right: 20),
                                          child: buildPowerItem(Icons.refresh,
                                              'Restart', 'reboot', ''),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0, right: 20),
                                          child: buildPowerItem(
                                              Icons.developer_mode,
                                              'Terminal',
                                              'killall',
                                              'pangolin_desktop'),
                                        ),
                                      ],
                                    )),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom: 75, left: 12, right: 12),
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
                        },
                        color: Colors.deepOrange[500],
                        child: Text('Reboot'))),
                Padding(
                    padding: EdgeInsets.only(top: 20.0, right: 20, bottom: 15),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 1.0,
                        color: Colors.deepOrange[500],
                        child: Text('Back'))),
              ]))
        ]));
  }
}
