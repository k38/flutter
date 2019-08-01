import 'package:flutter/material.dart';
import 'anim_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            // AnimWidget(child: FlutterLogo(size: 200), type: 'slideIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.0, value: 5.0),
            // AnimWidget(child: FlutterLogo(size: 200), type: 'slideIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.2, value: 5.0),
            // AnimWidget(child: FlutterLogo(size: 200), type: 'slideIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.4, value: 5.0),
            // AnimWidget(child: FlutterLogo(size: 200), type: 'slideIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.6, value: 5.0),
            // AnimWidget(child: FlutterLogo(size: 200), type: 'slideIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.8, value: 5.0),

            AnimWidget(child: FlutterLogo(size: 200), type: 'scaleIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.0),
            AnimWidget(child: FlutterLogo(size: 200), type: 'scaleIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.2),
            AnimWidget(child: FlutterLogo(size: 200), type: 'scaleIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.4),
            AnimWidget(child: FlutterLogo(size: 200), type: 'scaleIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.6),
            AnimWidget(child: FlutterLogo(size: 200), type: 'scaleIn', size: Size(200.0, 200.0), duration: 2000, delay: 0.8),
          ],
        )
      ),
    );
  }
}