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
                child: 
                
                ClipRRect(borderRadius: new BorderRadius.all(new Radius.circular(5.0)),child:
                
                 /**/
                        
                        new MyApp(),
                        
                        
                        ))),
        appBar: AppBar(
            backgroundColor: const Color(0x00ffffff),
            centerTitle: false,
            elevation: 0.0,
            title: Text(getSystem(), style: new TextStyle(fontSize:15.0,
            color: const Color(0xFFffffff),
            
            fontFamily: "Roboto"),)));
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

MaterialButton buildPowerItem(IconData icon, String label, String function) {
  return MaterialButton(
    onPressed: (){
      Process.run('xterm', ['']);
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
      body: 
      
      
      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Image.asset(
                                'lib/logo-color.png',
                                  width: 165.0,
                                  height: 32.0,
                                  fit: BoxFit.fill)),
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.only(left:25.0,right: 25.0, top:0.0, bottom: 35.0),
                                  child: Text(
                                  'Your system is in Recovery Mode. Recovery Mode can be used to repair your system, configure multiple operating systems, enable developer mode and more. Press Reboot to exit Recovery Mode, or press Continue to repair your system and view options.',
                                  style: TextStyle(
                                      color: Color(4278190080),
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.normal))), ),
                          Center(
                              child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Image.asset('lib/recoverylo.png', width: 196.0, height: 196.0))),
                          Align(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                  padding: EdgeInsets.only(top:20.0,right:20),
                                  child:
                                OutlineButton(
                                    onPressed: () {
                                                          showGeneralDialog(
                                                    barrierLabel: "Barrier",
                                                    barrierDismissible: true,
                                                    barrierColor: Colors.black.withOpacity(0.5),
                                                    transitionDuration: Duration(milliseconds: 200),
                                                    context: context,
                                                    pageBuilder: (_, __, ___) {
                                                      return Align(
                                                        alignment: Alignment.bottomCenter,
                                                        child: Container(
                                                          height: 90,
                                                          width: 400,
                                                          child: SizedBox.expand(child: new Center(child:new Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                            
                                                             Padding(
                                  padding: EdgeInsets.only(top:20.0,right:20),child: buildPowerItem(Icons.power_settings_new, 'Power off', 'null'),),
                                                            
                                                             Padding(
                                  padding: EdgeInsets.only(top:20.0,right:20),child: buildPowerItem(Icons.refresh, 'Restart', 'null'),),
                                                            
                                  Padding(
                                  padding: EdgeInsets.only(top:20.0,right:20),child: buildPowerItem(Icons.developer_mode, 'Terminal', 'null'),),
                                                            
                                                            ],)),),
                                                          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    transitionBuilder: (_, anim, __, child) {
                                                      return SlideTransition(
                                                        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
                                                        child: child,
                                                      );
                                                    },
                                                  );
          },
                                    color: Colors.deepOrange[500],
                                    child: Text('Reboot'))),
                                   
                                    Padding(
                                  padding: EdgeInsets.only(top:20.0,right:20),
                                  child:
                                RaisedButton(
                                  onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
                                   elevation: 1.0,
                                    color: Colors.deepOrange[500],
                                    child: Text('Continue'))),
                              ]))
                        ])
    






    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
