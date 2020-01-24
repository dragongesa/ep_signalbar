# ep_signalbar

Flutter widget to create signal bar, you can render signal-bar ui for your flutter project with this widget.

## Usage
To use this plugin, add `ep_signalbar` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

## Preview

![Image of Signalbar][signal]

[signal]: ./assets/signal.gif

### Example

``` dart
import 'package:flutter/material.dart';
import 'package:ep_signalbar/ep_signalbar.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eduprog Signalbar Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
    barBackgroundColor: Colors.white.withOpacity(0.6),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Set Bar Change"),
              color: Colors.red,
              onPressed: (){
                if (_sb1.state.getBarNumber() > 0){
                  _sb1.state.setBarNumber(_sb1.state.getBarNumber() - 1);
                }else{
                  _sb1.state.setBarNumber(5);
                }

              },
            ),
            _sb1,
            _sb2,
            _sb3,
            _sb4,
            _sb5,
            _sb6
          ],
        ),
      ), 
    );
  }
}

```


### Cheers

A.M Hirin

(eduprog.net)