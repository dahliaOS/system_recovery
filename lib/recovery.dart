import 'package:flutter/material.dart';








class RecoveryApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
            child: SizedBox(
                width: 650.0,
                height: 480.0,
                child: 
                
                ClipRRect(borderRadius: new BorderRadius.all(new Radius.circular(5.0)),child:
                
                 /*Column(
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
                                  padding: EdgeInsets.all(15.0),
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
                                  padding: EdgeInsets.all(23.0),
                                  child:
                                OutlineButton(
                                   
                                    color: Color(4294928896),
                                    child: Text('Reboot'))),
                                   
                                    Padding(
                                  padding: EdgeInsets.all(23.0),
                                  child:
                                RaisedButton(
                                   elevation: 1.0,
                                    color: Color(4294928896),
                                    child: Text('Continue'))),
                              ]))
                        ])*/
                        
                        new MyApp(),
                        
                        
                        ))),
        appBar: AppBar(
            backgroundColor: const Color(0x00ffffff),
            centerTitle: false,
            elevation: 0.0,
            title: Text('Recovery Mode', style: new TextStyle(fontSize:15.0,
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



class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
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
