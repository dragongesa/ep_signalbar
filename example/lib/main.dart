import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ep_signalbar/ep_signalbar.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eduprog Signalbar Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  EPSignalBar _sb1 = EPSignalBar(initBarValue: 5,);
  EPSignalBar _sb2 = EPSignalBar(
    barHeight: 100,
    barWidth: 200,
    barCount: 10,
    initBarValue: 8,
    animationCurve: Curves.easeOut,
    animationDuration: Duration(milliseconds: 200),
    barOnlineColor: Colors.blue,
    barOfflineColor: Colors.grey,
    barBorderColor: Colors.blue,
    barBackgroundColor: Colors.white.withOpacity(0.3),
  );
  EPSignalBar _sb3 = EPSignalBar(
    barHeight: 50,
    barWidth: 100,
    barCount: 4,
    initBarValue: 2,
    barOnlineColor: Colors.orangeAccent,
  );
  EPSignalBar _sb4 = EPSignalBar(
    barHeight: 50,
    barWidth: 100,
    barCount: 4,
    barOnlineColor: Colors.purple,
    barOfflineColor: Colors.black,
  );
  EPSignalBar _sb5 = EPSignalBar(
    barHeight: 100,
    barWidth: 300,
    barCount: 15,
    initBarValue: 3,
    animationCurve: Curves.easeOut,
    animationDuration: Duration(milliseconds: 200),
    barOnlineColor: Colors.redAccent,
    barBackgroundColor: Colors.white.withOpacity(0.6),
  );

  EPSignalBar _sb6 = EPSignalBar(
    barHeight: 100,
    barWidth: 300,
    barCount: 10,
    initBarValue: 7,
    animationDuration: Duration(milliseconds: 200),
    barOnlineColor: Colors.green,
    barBackgroundColor: Colors.grey.withOpacity(0.4),
    barBorderColor: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Eduprog Widget Signalbar", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    _sb1,
                    _sb2,
                    _sb3,
                    _sb4,
                    _sb6
                  ],
                ),
              ),
              Container(
                height: 300,
                child: _sb5,

              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (_sb2.state.getBarNumber() > 1){
        _sb2.state.setBarNumber(_sb2.state.getBarNumber() - 1);
      }else{
        _sb2.state.setBarNumber(_sb2.barCount);
      }

      if (_sb5.state.getBarNumber() > 1){
        _sb5.state.setBarNumber(_sb5.state.getBarNumber() - 1);
      }else{
        _sb5.state.setBarNumber(_sb5.barCount);
      }

    });
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (_sb3.state.getBarNumber() == 3){
        _sb3.state.setBarNumber(2);
      }else{
        _sb3.state.setBarNumber(3);
      }

      if (_sb4.state.getBarNumber() > 1){
        _sb4.state.setBarNumber(_sb4.state.getBarNumber() - 1);
      }else{
        _sb4.state.setBarNumber(_sb4.barCount);
      }

      if (_sb6.state.getBarNumber() == 2){
        _sb6.state.setBarNumber(4);
      }else if (_sb6.state.getBarNumber() == 4){
        _sb6.state.setBarNumber(10);
      }else if (_sb6.state.getBarNumber() == 10){
        _sb6.state.setBarNumber(5);
      }else if (_sb6.state.getBarNumber() == 5){
        _sb6.state.setBarNumber(0);
      }else{
        _sb6.state.setBarNumber(2);
      }

      if (_sb5.barHeight > 200){
        _sb5.state.setWidgetHeight(200);
      }else{
        _sb5.state.setWidgetHeight(250);
      }
    });

    super.initState();
  }

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }
}

