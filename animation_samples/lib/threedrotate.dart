import 'package:flutter_web/material.dart';

// https://medium.com/flutter/perspective-on-flutter-6f832f4d912e

class ThreeDRotateLogo extends StatefulWidget {
  ThreeDRotateLogo({Key key}) : super(key: key); // changed

  @override
  _ThreeDRotateLogoState createState() => _ThreeDRotateLogoState();
}

class _ThreeDRotateLogoState extends State<ThreeDRotateLogo> {
  int _counter = 0;
  Offset _offset = Offset(0.4, 0.7); // new

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(  // Transform widget
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(_offset.dy)
        ..rotateY(_offset.dx),
      alignment: FractionalOffset.center,
      child: _defaultApp(context),
    );
  }

  _defaultApp(BuildContext context) {  // new
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('The Matrix 3D'), // changed
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           'You have pushed the button this many times:',
    //         ),
    //         Text(
    //           '$_counter',
    //           style: Theme.of(context).textTheme.display1,
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ),
    // );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }

}