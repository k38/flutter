// import 'package:flutter_web/animation.dart';
// import 'package:flutter_web/io.dart';
import 'package:flutter_web/material.dart';
import 'package:animation_/rotateLogo.dart';
import 'package:animation_/scaleLogo.dart';
import 'package:animation_/threedrotate.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);
  final double degrees = 150;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
        ),
        body: ListView(
          children: <Widget>[
            RotateLogo(),
            ScaleLogo(),
            // ThreeDRotateLogo(),
          ],
        ),
      ),
    );
  }  
}
